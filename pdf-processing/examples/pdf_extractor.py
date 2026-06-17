"""
PDF Content Extractor
====================

AI Agent Prompt:
----------------
You are an expert in PDF processing and Python. Implement a comprehensive PDF content extractor:

1. EXTRACTION CAPABILITIES:
   - Extract raw text from PDFs
   - Extract text with formatting (bold, italic, etc.)
   - Extract text with position information
   - Extract images from PDFs
   - Extract metadata (author, title, etc.)
   - Extract document structure (headings, paragraphs, etc.)

2. IMPLEMENTATION:
   - Use PyPDF2 or pdfminer.six for text extraction
   - Use pdf2image or PyMuPDF for image extraction
   - Support for both text-based and scanned PDFs
   - Handle encrypted PDFs
   - Process multi-page documents

3. ADVANCED FEATURES:
   - Text layout analysis
   - Table detection and extraction
   - Form field extraction
   - Annotation extraction
   - Bookmark extraction

4. EXAMPLE:
   - Create a function that extracts:
     * All text with formatting
     * All images
     * All metadata
     * Document structure
   - Process a sample PDF and display results

5. PERFORMANCE:
   - Batch processing of multiple PDFs
   - Memory-efficient processing
   - Parallel processing for large documents
   - Progress reporting

6. ERROR HANDLING:
   - Handle corrupted PDFs
   - Handle password-protected PDFs
   - Handle different PDF versions
   - Graceful degradation

7. OUTPUT FORMATS:
   - JSON output
   - Structured data output
   - HTML output
   - Markdown output

This should be a production-ready PDF extraction tool that can handle various PDF types.
"""
