package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.component.LinkArea;
	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class Page implements Element
	{
		private var _objectNumber:int = 0;
		public var paperSize:PaperSize;

		public var linkAreas:Array = new Array();

		public function get objectNumber():int{
			if(_objectNumber == 0){
				_objectNumber = ObjectNumberMaker.createNewObjectNumber();
			}
			return _objectNumber;
		}

		public function set objectNumber(value:int):void{
			_objectNumber = value;
		}

		public var contents:Contents;
		public var resources:Resources;
		public var parent:Pages;

		public function Page(paperSize:PaperSize=null){
			this.paperSize = (paperSize == null) ? PaperSize.A4 : paperSize;
		}

		public function addLinkArea(linkArea:LinkArea):void{
			linkAreas.push(linkArea);
		}

		public function createMediaBoxValue():String{
			return StringTool.setValue("/MediaBox [0 0 {0} {1}]", [paperSize.width, paperSize.height]) + Writer.endOfLine;
		}

		public static function createAnnotsStreamValue(linkAreas:Array):String{
			if(linkAreas.length == 0){
				return "";
			}

			var streamValue:String = "";
			streamValue += "/Annots [" + Writer.endOfLine;
			for each(var linkArea:LinkArea in linkAreas){
				streamValue += linkArea.toStreamValue();
			}
			streamValue += "]" + Writer.endOfLine;
			return streamValue;
		}

		public function selfToPdfObject():PdfObject{
			var annotsStreamValue:String = createAnnotsStreamValue(linkAreas);


			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<</Type /Page" + Writer.endOfLine;
			string += StringTool.setValue("/Parent {0} 0 R", [parent.objectNumber]) + Writer.endOfLine;
			string += createMediaBoxValue();
			string += StringTool.setValue("/Resources {0} 0 R", [resources.objectNumber]) + Writer.endOfLine;

			string += annotsStreamValue;

			string += "/Rotate 0" + Writer.endOfLine;
			string += StringTool.setValue("/Contents {0} 0 R>>", [contents.objectNumber]) + Writer.endOfLine;
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
			return pdfObjects;
		}

	}
}

