# PDF Processing

PDF processing for AI systems starts with structure inspection: metadata,
streams, text operators, OCR needs, and suspicious embedded behavior.

## Contents

- `examples/pdf_extractor.py`: dependency-light text and stream extraction.
- `examples/pdf_ocr.py`: OCR pipeline with injected renderer and engine.
- `examples/pdf_metadata.py`: metadata, object count, hash, and JavaScript signals.
- `docs/PDF_INTERNALS.md`: internals guide for developers and forensic analysts.

## Run

```bash
python3 -m unittest tests/test_pdf_examples.py
```
