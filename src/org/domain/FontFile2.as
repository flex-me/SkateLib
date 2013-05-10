package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class FontFile2 implements Element
	{
		private var _objectNumber:int = 0;

		public var fontStreamArial:ByteArray;

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

		public function FontFile2()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			pdfObject.string = "";

			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine, Writer.defaultCharSet);
			//Refactor: should extract the lenth values. 
			pdfObject.byteArray.writeMultiByte("<</Length 197865" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("/Filter /FlateDecode" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("/Length1 367112>>" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("stream" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeBytes(fontStreamArial);
			pdfObject.byteArray.writeMultiByte("endstream" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("endobj" + Writer.endOfLine, Writer.defaultCharSet);
			return pdfObject;
		}

		public function toPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			var pdfObject:PdfObject = this.selfToPdfObject();
			pdfObjects.addItem(pdfObject);
			return pdfObjects;
		}

	}
}

