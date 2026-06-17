# PDF Internals for Developers and Forensic Analysts

A PDF is a graph of numbered objects plus a cross-reference table or stream that
tells readers where those objects live. It is not just a page image.

```text
%PDF-1.7
1 0 obj
<< /Type /Catalog /Pages 2 0 R >>
endobj
...
xref
trailer
<< /Root 1 0 R >>
%%EOF
```

## Core Structures

| Structure | Purpose |
| --- | --- |
| Header | Declares the PDF version |
| Object | Stores dictionaries, arrays, streams, strings, and names |
| Stream | Holds compressed page content, images, fonts, or metadata |
| XRef | Maps object numbers to byte offsets |
| Trailer | Points to the catalog and info dictionaries |

## Text Extraction

PDF text appears inside page content streams. Common operators:

- `Tj`: show one string.
- `TJ`: show an array of strings and spacing adjustments.
- `BT` / `ET`: begin and end a text object.

Compressed streams often use `/Filter /FlateDecode`, which can be inflated with
zlib before scanning operators.

## Metadata and Forensics

Look for:

- `/Title`, `/Author`, `/Producer`, `/Creator`, `/CreationDate`.
- Embedded JavaScript: `/JavaScript` or `/JS`.
- Incremental updates: multiple `%%EOF` markers.
- Embedded files: `/EmbeddedFiles`.
- Object streams that hide many compressed objects.

## Minimal Hex View

```text
25 50 44 46 2d 31 2e 37 0a
%  P  D  F  -  1  .  7
```

## Practical Guidance

Use mature parsers such as pypdf, pdfminer.six, PyMuPDF, or qpdf for production.
Use small raw-byte tools for triage, testing, and forensic sanity checks. The
examples in `../examples` show how to inspect headers, streams, text operators,
OCR extension points, metadata, hashes, and suspicious JavaScript markers.
