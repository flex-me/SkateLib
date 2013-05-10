package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.component.Component;
	import org.component.FilledColor;
	import org.component.FreeDrawingScript;
	import org.component.Image;
	import org.component.Polygon;
	import org.component.Rectangle;
	import org.component.RectangleText;
	import org.component.Segment;
	import org.component.StrokeColor;
	import org.component.StrokeWidth;
	import org.component.Text;
	import org.component.WrapText;
	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.StringTool;

	//Refactor: Element interface must be used by some clients. 
	public class Contents implements Element
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

		public var components:Array = new Array();

		public function addText(text:Text):void{
			components.push(text);
		}

		public function addImage(image:Image):void{
			components.push(image);
		}

		public function setFilledColor(filledColor:FilledColor):void{
			components.push(filledColor);
		}

		public function setStrokeColor(strokeColor:StrokeColor):void{
			components.push(strokeColor);
		}

		public function addRectangle(rectangle:Rectangle):void{
			components.push(rectangle);
		}

		public function addFreeDrawingScript(freeDrawingScript:FreeDrawingScript):void{
			components.push(freeDrawingScript);
		}

		public function addPolygon(polygon:Polygon):void{
			components.push(polygon);
		}

		public function addSegment(segment:Segment):void{
			components.push(segment);
		}

		public function setStrokeWidth(strokeWidth:StrokeWidth):void{
			components.push(strokeWidth);
		}
		public function addRectangleText(rectangleText:RectangleText):void{
			components.push(rectangleText);
		}

		public function addWrapText(wrapText:WrapText):void{
			components.push(wrapText);
		}

		public function Contents()
		{
		}

		public function concatComponents():String{
			var concatenationStreamValue:String = "";
			for each(var component:Component in components){
				concatenationStreamValue += component.toStreamValue();
			}
			return concatenationStreamValue;
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
//			var concatenationStreamValue:String = streamValues.join("");
			var concatenationStreamValue:String = concatComponents();

			var string:String = StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine;
			string += StringTool.setValue("<</Length {0}>>", [concatenationStreamValue.length]) + Writer.endOfLine;
			string += "stream" + Writer.endOfLine;
			string += concatenationStreamValue;
			string += "endstream" + Writer.endOfLine;
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

