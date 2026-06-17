from pathlib import Path
import importlib.util
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
MINIMAL_PDF = b"""%PDF-1.7
1 0 obj
<< /Type /Catalog /Pages 2 0 R /Title (Demo) /Author (Kobi) >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R] /Count 1 >>
endobj
3 0 obj
<< /Type /Page /Contents 4 0 R >>
endobj
4 0 obj
<< /Length 18 >>
stream
(Hello PDF) Tj
endstream
endobj
%%EOF
"""


def load_module(name: str, relative: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    assert spec and spec.loader
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


class PDFExampleTests(unittest.TestCase):
    def test_pdf_extractor_reads_literal_text(self):
        extractor = load_module("pdf_extractor", "pdf-processing/examples/pdf_extractor.py")
        with tempfile.NamedTemporaryFile(suffix=".pdf") as tmp:
            tmp.write(MINIMAL_PDF)
            tmp.flush()
            result = extractor.extract_pdf(tmp.name)
        self.assertEqual(result.pages, 1)
        self.assertIn("Hello PDF", result.text)

    def test_pdf_metadata_extracts_info_and_hash(self):
        metadata = load_module("pdf_metadata", "pdf-processing/examples/pdf_metadata.py")
        with tempfile.NamedTemporaryFile(suffix=".pdf") as tmp:
            tmp.write(MINIMAL_PDF)
            tmp.flush()
            result = metadata.analyze_pdf(tmp.name)
        self.assertEqual(result.version, "1.7")
        self.assertEqual(result.info["Title"], "Demo")
        self.assertEqual(len(result.sha256), 64)

    def test_ocr_pipeline_uses_injected_engine(self):
        ocr = load_module("pdf_ocr", "pdf-processing/examples/pdf_ocr.py")
        with tempfile.NamedTemporaryFile() as tmp:
            tmp.write(b"OCR:Scanned text")
            tmp.flush()
            pages = ocr.PDFOCRPipeline(ocr.DemoRenderer(), ocr.DemoOCREngine()).run(tmp.name)
        self.assertEqual(pages[0].text, "Scanned text")


if __name__ == "__main__":
    unittest.main()
