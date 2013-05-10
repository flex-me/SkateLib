package org.component
{
	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.util.WrapStringsMaker;

	public class RectangleTextContent
	{
		public static const LEFT:String = "LEFT";
		public static const RIGHT:String = "RIGHT";
		public static const CENTER:String = "CENTER";

		private var text:String;
		private var fontSize:Number;
		private var baseFont:BaseFont;
		private var textFilledColor:RgbColor;
		private var rectangle:Rectangle;

		public var paddingLeft:Number = 0;
		public var paddingRight:Number = 0;
		public var horizontalAlign:String = RectangleTextContent.LEFT;

		public function RectangleTextContent(text:String, fontSize:Number, baseFont:BaseFont, textFilledColor:RgbColor, rectangle:Rectangle)
		{
			this.text = text;
			this.fontSize = fontSize;
			this.baseFont = (baseFont == null)? StandardFonts.helvetica : baseFont;
			this.textFilledColor = (textFilledColor == null) ? RgbColor.Black : textFilledColor;
			this.rectangle = rectangle;
		}

		public static function getVerticalCenteredTextPositionY(rectangle:Rectangle, fontSize:Number):Number{
			return rectangle.y + 0.5 * rectangle.height - 0.3 * fontSize;
		}

		public static function getTextHorizontalPositionXWithAlign(rectangle:Rectangle, paddingLeft:Number, paddingRight:Number, 
			text:String, fontSize:Number, baseFont:BaseFont, horizontalAlign:String):Number{

			if(horizontalAlign == RectangleTextContent.RIGHT){
				var textWidth:Number = WrapStringsMaker.getStringWidth(text, fontSize, baseFont);
				return rectangle.x + (rectangle.width - paddingRight - textWidth);
			}
			if(horizontalAlign == RectangleTextContent.CENTER){
				var textWidthNew:Number = WrapStringsMaker.getStringWidth(text, fontSize, baseFont);
				return rectangle.x + (rectangle.width - textWidthNew) / 2;
			}
			return rectangle.x + paddingLeft;
		}

		public function toStreamValue():String{
			//Refactor: should move this textFilledColor to Constructor. 
			if(textFilledColor == null){
				textFilledColor = RgbColor.Black;
			}
			var streamValue:String = "";
			var positionX:Number;
			positionX = getTextHorizontalPositionXWithAlign(rectangle, paddingLeft, paddingRight, text, fontSize, baseFont, horizontalAlign);
			var positionY:Number = getVerticalCenteredTextPositionY(rectangle, fontSize);
			streamValue += new FilledColor(textFilledColor).toStreamValue();
			streamValue += new Text(text, positionX, positionY, fontSize, baseFont).toStreamValue();
			return streamValue;
		}

		public function getBaseFont():BaseFont{
			return baseFont;
		}

		public function getTextFilledColor():RgbColor{
			return textFilledColor;
		}
	}
}

