package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class Catalog implements Element
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

		public var pages:Pages;
		public var startPage:Page;

		public function setObjectNumber(objectNumber:int):void{
			this.objectNumber = objectNumber;
		}

		public function Catalog()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;

			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<<" + Writer.endOfLine;
			string += "/Type /Catalog" + Writer.endOfLine;
			string += StringTool.setValue("/Pages {0} 0 R", [pages.objectNumber]) + Writer.endOfLine;
			string += StringTool.setValue("/OpenAction [{0} 0 R /FitH null]", [startPage.objectNumber]) + Writer.endOfLine;
			string += "/PageLayout /SinglePage" + Writer.endOfLine;
			string += "/PageMode /UseNone" + Writer.endOfLine;
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

