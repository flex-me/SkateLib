package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class Info implements Element
	{
		private var _objectNumber:int = 0;

		public function get objectNumber():int{
			if(_objectNumber == 0){
				_objectNumber = ObjectNumberMaker.createNewObjectNumber();
			}
			return _objectNumber;
		}

		public function set objectNumber(value:int):void{
			_objectNumber = value;
		}

		//Refactor: should remove this method. 
		public function setObjectNumber(objectNumber:int):void{
			this.objectNumber = objectNumber;
		}

		public function Info()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<<" + Writer.endOfLine;
			string += "/Producer (AlivePDF 0.1.5 RC)" + Writer.endOfLine;
			string += "/CreationDate (D:201009251322)" + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += "endobj" + Writer.endOfLine;
			pdfObject.string = string;

			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);
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

