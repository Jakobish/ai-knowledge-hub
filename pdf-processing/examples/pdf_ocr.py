"""OCR pipeline skeleton for scanned PDFs.

The pipeline is dependency-injected: pass a renderer and OCR engine in
production, or use the deterministic demo adapters for tests.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Protocol


class PageRenderer(Protocol):
    def render(self, pdf_path: Path) -> list[bytes]:
        ...


class OCREngine(Protocol):
    def recognize(self, image_bytes: bytes) -> str:
        ...


@dataclass
class OCRPage:
    page_number: int
    text: str
    confidence: float


class PDFOCRPipeline:
    def __init__(self, renderer: PageRenderer, engine: OCREngine, min_confidence: float = 0.5) -> None:
        self.renderer = renderer
        self.engine = engine
        self.min_confidence = min_confidence

    def run(self, pdf_path: str | Path) -> list[OCRPage]:
        pages = []
        for index, image in enumerate(self.renderer.render(Path(pdf_path)), start=1):
            text = self.engine.recognize(image).strip()
            confidence = 0.9 if text else 0.0
            if confidence >= self.min_confidence:
                pages.append(OCRPage(index, text, confidence))
        return pages


class DemoRenderer:
    def render(self, pdf_path: Path) -> list[bytes]:
        return [pdf_path.read_bytes()]


class DemoOCREngine:
    def recognize(self, image_bytes: bytes) -> str:
        marker = b"OCR:"
        if marker in image_bytes:
            return image_bytes.split(marker, 1)[1].decode("utf-8", errors="ignore")
        return ""


if __name__ == "__main__":
    import sys

    pipeline = PDFOCRPipeline(DemoRenderer(), DemoOCREngine())
    for page in pipeline.run(sys.argv[1]):
        print(f"page {page.page_number}: {page.text}")
