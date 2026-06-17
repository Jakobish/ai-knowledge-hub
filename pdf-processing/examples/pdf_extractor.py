"""Dependency-light PDF text and structure extractor."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
import zlib


@dataclass
class PDFExtraction:
    pages: int
    text: str
    streams: int
    warnings: list[str]


def _decode_pdf_string(value: bytes) -> str:
    return value.decode("latin-1", errors="ignore").replace(r"\(", "(").replace(r"\)", ")")


def extract_literal_text(data: bytes) -> str:
    parts = []
    for match in re.finditer(rb"\((.*?)\)\s*Tj", data, flags=re.S):
        parts.append(_decode_pdf_string(match.group(1)))
    for array in re.finditer(rb"\[(.*?)\]\s*TJ", data, flags=re.S):
        parts.extend(_decode_pdf_string(item) for item in re.findall(rb"\((.*?)\)", array.group(1), flags=re.S))
    return "\n".join(part for part in parts if part.strip())


def extract_streams(data: bytes) -> list[bytes]:
    streams = []
    for match in re.finditer(rb"stream\r?\n(.*?)\r?\nendstream", data, flags=re.S):
        stream = match.group(1)
        prefix = data[max(0, match.start() - 300):match.start()]
        if b"FlateDecode" in prefix:
            try:
                stream = zlib.decompress(stream)
            except zlib.error:
                pass
        streams.append(stream)
    return streams


def extract_pdf(path: str | Path) -> PDFExtraction:
    data = Path(path).read_bytes()
    warnings: list[str] = []
    if not data.startswith(b"%PDF-"):
        warnings.append("missing PDF header")

    streams = extract_streams(data)
    combined = data + b"\n" + b"\n".join(streams)
    text = extract_literal_text(combined)
    pages = len(re.findall(rb"/Type\s*/Page\b", data))
    return PDFExtraction(pages=pages, text=text, streams=len(streams), warnings=warnings)


if __name__ == "__main__":
    import sys

    for pdf in sys.argv[1:]:
        print(extract_pdf(pdf))
