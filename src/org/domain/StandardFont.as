package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.StringTool;

	public class StandardFont extends BaseFont
	{
		public function StandardFont()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<</Type /Font" + Writer.endOfLine;
			string += StringTool.setValue("/BaseFont /{0}", [fontName]) + Writer.endOfLine;

			string += "/Subtype /Type1" + Writer.endOfLine;
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
			var pdfObject:PdfObject = this.selfToPdfObject();
			pdfObjects.addItem(pdfObject);
			return pdfObjects;
		}
	}
}

