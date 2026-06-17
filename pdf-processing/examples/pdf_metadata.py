"""PDF metadata and forensic signal extractor."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import hashlib
import re


@dataclass
class PDFMetadata:
    version: str | None
    info: dict[str, str]
    object_count: int
    has_javascript: bool
    sha256: str


def extract_info_dictionary(data: bytes) -> dict[str, str]:
    info: dict[str, str] = {}
    for key, value in re.findall(rb"/([A-Za-z]+)\s*\((.*?)\)", data, flags=re.S):
        info[key.decode("ascii", errors="ignore")] = value.decode("latin-1", errors="ignore")
    return info


def analyze_pdf(path: str | Path) -> PDFMetadata:
    data = Path(path).read_bytes()
    header = re.match(rb"%PDF-(\d\.\d)", data)
    return PDFMetadata(
        version=header.group(1).decode("ascii") if header else None,
        info=extract_info_dictionary(data),
        object_count=len(re.findall(rb"\n\d+\s+\d+\s+obj\b", data)),
        has_javascript=bool(re.search(rb"/JavaScript|/JS\b", data)),
        sha256=hashlib.sha256(data).hexdigest(),
    )


if __name__ == "__main__":
    import sys

    for pdf in sys.argv[1:]:
        print(analyze_pdf(pdf))
