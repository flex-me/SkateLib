package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class Pages implements Element
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

		public var pageList:Array = new Array();

		public function Pages()
		{
		}

		public function addPage(page:Page):void{
			pageList.push(page);
		}

		public function getCurrentPage():Page{
			return pageList[pageList.length - 1] as Page;
		}

		public static function createObjectReferencesString(pageList:Array):String{
			var objectreferencesArray:Array = new Array();
			for each(var page:Page in pageList){
				objectreferencesArray.push(page.objectNumber + " 0 R");
			}
			return objectreferencesArray.join(" ");
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<</Type /Pages" + Writer.endOfLine;
			var objectReferencesString:String = createObjectReferencesString(pageList);
			string += StringTool.setValue("/Kids [{0}]", [objectReferencesString]) + Writer.endOfLine;
			string += StringTool.setValue("/Count {0}>>", [pageList.length]) + Writer.endOfLine;
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
			//Refactor: should treat page as an Element. 
			for each(var page:Page in pageList){
				pdfObjects.addAll(page.toPdfObjects());
				pdfObjects.addAll(page.contents.toPdfObjects());
			}
			return pdfObjects;
		}		
	}
}











