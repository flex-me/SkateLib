package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class FontDescriptor implements Element
	{
		private var _objectNumber:int = 0;
		public var fontFile2:FontFile2;

		public function get objectNumber():int{
			if(_objectNumber == 0){
				_objectNumber = ObjectNumberMaker.createNewObjectNumber();
			}
			return _objectNumber;
		}

		public function set objectNumber(value:int):void{
			_objectNumber = value;
		}

		public function setObjectNumber(objectNumber:int):void{
			this.objectNumber = objectNumber;
		}

		public function FontDescriptor()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;

			string += "<</Type /FontDescriptor" + Writer.endOfLine;
			string += "/FontName /ArialMT" + Writer.endOfLine;
			string += "/FontWeight /Regular" + Writer.endOfLine;
			string += "/Descent -212" + Writer.endOfLine;
			string += "/Ascent 905" + Writer.endOfLine;
			string += "/AvgWidth 750" + Writer.endOfLine;
			string += "/Flags 32" + Writer.endOfLine;
			string += "/FontBBox [-664 -325 2000 1006]" + Writer.endOfLine;
			string += "/ItalicAngle 0" + Writer.endOfLine;
			string += "/StemV 70" + Writer.endOfLine;
			string += "/MissingWidth 750" + Writer.endOfLine;
			string += "/CapHeight 716" + Writer.endOfLine;
			string += StringTool.setValue("/FontFile2 {0} 0 R", [fontFile2.objectNumber]) + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += "endobj" + Writer.endOfLine;

			pdfObject.string = string;
			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);
			return pdfObject;
		}

		public function toPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			var pdfObject:PdfObject = selfToPdfObject();
			pdfObjects.addItem(pdfObject);

			var fontFile2PdfObjects:ArrayCollection = fontFile2.toPdfObjects();
			pdfObjects.addAll(fontFile2PdfObjects);

			return pdfObjects;
		}

	}
}

