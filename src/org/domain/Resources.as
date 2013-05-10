package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	public class Resources implements Element
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

		public var baseFonts:Array = new Array();

		public function isNewBaseFont(baseFont:BaseFont):Boolean{
			for each(var item:BaseFont in baseFonts){
				if(item.shortFontName == baseFont.shortFontName){
					return false;
				}
			}
			return true;
		}

		public function addBaseFont(baseFont:BaseFont):void{
			if(baseFont == null){
				return;
			}
			if(isNewBaseFont(baseFont)){
				baseFonts.push(baseFont);
			}
		}

		public var imageXObjects:Array = new Array();

		public function isNewImageXObject(imageXObject:ImageXObject):Boolean{
			for each(var item:ImageXObject in imageXObjects){
				if(item.shortXObjectName == imageXObject.shortXObjectName){
					return false;
				}
			}
			return true;
		}

		public function addImageXObject(imageXObject:ImageXObject):void{
			if(isNewImageXObject(imageXObject)){
				imageXObjects.push(imageXObject);
			}
		}

		public function getImageXObjectValues():String{
			var imageXObjectValueList:Array = new Array();
			for each(var imageXObject:ImageXObject in imageXObjects){
				var imageXObjectValue:String = StringTool.setValue("/{0} {1} 0 R", [imageXObject.shortXObjectName, imageXObject.objectNumber]) + Writer.endOfLine;
				imageXObjectValueList.push(imageXObjectValue);
			}
			return imageXObjectValueList.join("");
		}

		public function getFontValues():String{
			var fontValueList:Array = new Array();
			for each(var baseFont:BaseFont in baseFonts){
				var fontValues:String = StringTool.setValue("/{0} {1} 0 R", [baseFont.shortFontName, baseFont.objectNumber]) + Writer.endOfLine;
				fontValueList.push(fontValues);
			}
			return fontValueList.join("");
		}

		public function Resources()
		{
		}

		public function selfToPdfObject():PdfObject{
			var fontValues:String = this.getFontValues();
			var imageXObjectValues:String = this.getImageXObjectValues();

			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += "<<" + Writer.endOfLine;
			string += "/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]" + Writer.endOfLine;
			string += "/Font <<" + Writer.endOfLine;
			string += fontValues;
			string += ">>" + Writer.endOfLine;
			string += "/XObject <<" + Writer.endOfLine;

			string += imageXObjectValues;

			string += ">>" + Writer.endOfLine;
			string += "/ColorSpace <<" + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += "/Shading <<" + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += ">>" + Writer.endOfLine;
			string += "endobj" + Writer.endOfLine;
			pdfObject.string = string;

			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);
			return pdfObject;
		}

		public function toPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();

			pdfObjects.addItem(selfToPdfObject());
			for each(var baseFont:BaseFont in baseFonts){
				pdfObjects.addAll(baseFont.toPdfObjects());
			}
			for each(var imageXObject:ImageXObject in imageXObjects){
				pdfObjects.addAll(imageXObject.toPdfObjects());
			}

			return pdfObjects;
		}

	}
}










