package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.StringTool;

	public class EmbededFont extends BaseFont
	{
		public var fontDescriptor:FontDescriptor;

		public function EmbededFont()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;

			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<</Type /Font" + Writer.endOfLine;
			string += StringTool.setValue("/BaseFont /{0}", [fontName]) + Writer.endOfLine;
			string += "/Subtype /TrueType" + Writer.endOfLine;
			string += "/FirstChar 32" + Writer.endOfLine;
			string += "/LastChar 255" + Writer.endOfLine;
			string += "/Widths [278 278 355 556 556 889 667 191 333 333 389 584 278 333 278 278 556 556 556 556 556 556 556 556 556 556 278 278 584 584 584 556 1015 667 667 722 722 667 611 778 722 278 500 667 556 833 722 778 667 778 722 667 611 722 667 944 667 667 611 278 278 278 469 556 333 556 556 500 556 556 278 556 556 222 222 500 222 833 556 556 556 556 333 500 278 556 500 722 500 500 500 334 260 334 584 750 556 750 222 556 333 1000 556 556 333 1000 667 333 1000 750 611 750 750 222 222 333 333 350 556 1000 333 1000 500 333 944 750 500 667 278 333 556 556 556 556 260 556 333 737 370 556 584 333 737 333 400 549 333 333 333 576 537 278 333 333 365 556 834 834 834 611 667 667 667 667 667 667 1000 722 667 667 667 667 278 278 278 278 722 722 778 778 778 778 778 584 778 722 722 722 722 667 667 611 556 556 556 556 556 556 889 500 556 556 556 556 278 278 278 278 556 556 556 556 556 556 556 549 611 556 556 556 556 500 556 500]" + Writer.endOfLine;
			string += StringTool.setValue("/FontDescriptor {0} 0 R", [fontDescriptor.objectNumber]) + Writer.endOfLine;
			string += "/Encoding /WinAnsiEncoding" + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += "endobj" + Writer.endOfLine;
			pdfObject.string = string;

			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);
			return pdfObject;
		}

		public override function toPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			var embededFontPdfObject:PdfObject = this.selfToPdfObject();
			pdfObjects.addItem(embededFontPdfObject);
			var fontDescriptorPdfObjects:ArrayCollection = fontDescriptor.toPdfObjects();
			pdfObjects.addAll(fontDescriptorPdfObjects);
			return pdfObjects;
		}

	}
}

