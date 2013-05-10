package org.facility
{
	import org.component.RectangleText;
	import org.component.RectangleTextBorder;
	import org.component.RectangleTextContent;
	import org.component.Segment;
	import org.component.StrokeColor;
	import org.component.StrokeWidth;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.main.Document;
	import org.util.StringTool;

	public class Assistant
	{
		public static function makeGrid(document:Document):void{
			for(var i:int = 0 ; i < 6 ; i++){
				var x:Number = 0 + 100 * i;
				for(var j:int = 0 ; j < 9 ; j++){
					var y:Number = 0 + 100 * j;
					var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(new org.component.Rectangle(x, y, 100, 100), null, RgbColor.hexStringToRGBColor("#7A96DF"));
					var rectangleTextContent:RectangleTextContent = new RectangleTextContent(StringTool.setValue("({0}, {1})", [x, y]), 10, StandardFonts.timesRoman, RgbColor.GrassGreen, new org.component.Rectangle(x, y, 100, 100));
					var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
					document.addRectangleText(rectangleText);
				}
			}
		}

		private static function drawHorizontalLines(document:Document):void{
			for(var i:int = 0 ; i < document.pages.getCurrentPage().paperSize.height ; i = i + 10){
				var startPoint:org.component.Point = new org.component.Point(0, i);
				var endPoint:org.component.Point = new org.component.Point(document.pages.getCurrentPage().paperSize.width, i);
				var line:Segment = new Segment(startPoint, endPoint);
				document.addSegment(line);
			}
		}

		private static function drawVerticalLines(document:Document):void{
			for(var i:int = 0 ; i < document.pages.getCurrentPage().paperSize.width ; i = i + 10){
				var startPoint:org.component.Point = new org.component.Point(i, 0);
				var endPoint:org.component.Point = new org.component.Point(i, document.pages.getCurrentPage().paperSize.height);
				var line:Segment = new Segment(startPoint, endPoint);
				document.addSegment(line);
			}
		}

		public static function drawComplexGrid(document:Document):void{
			document.setStrokeWidth(new StrokeWidth(5));
			makeGrid(document);
			document.setStrokeWidth(new StrokeWidth(1));
			document.setStrokeColor(new StrokeColor(RgbColor.hexStringToRGBColor("#DEDEDE")));
			drawHorizontalLines(document);
			drawVerticalLines(document);
		}
	}
}

