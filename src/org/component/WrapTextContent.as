package org.component
{
	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.util.WrapStringsMaker;

	public class WrapTextContent
	{
		private var string:String;
		private var fontSize:Number;
		private var cellRectangleWidth:Number;
		private var cellRectangleHeight:Number;
		private var positionX:Number;
		private var positionY:Number;
		private var baseFont:BaseFont;
		public var textFilledColor:RgbColor = RgbColor.Black;
		private var tick:String;

		public var paddingLeft:Number = 0;
		public var paddingRight:Number = 0;
		public var horizontalAlign:String = RectangleTextContent.LEFT;

		public function getPositionY():Number{
			return positionY;
		}

		public function WrapTextContent(string:String, fontSize:Number, cellRectangleWidth:Number, cellRectangleHeight:Number, 
			positionX:Number, positionY:Number, baseFont:BaseFont, textFilledColor:RgbColor, tick:String="-")
		{
			this.string = string;
			this.fontSize = fontSize;
			this.cellRectangleWidth = cellRectangleWidth;
			this.cellRectangleHeight = cellRectangleHeight;
			this.positionX = positionX;
			this.positionY = positionY;
			this.baseFont = (baseFont == null)? StandardFonts.helvetica : baseFont;
			this.textFilledColor = textFilledColor;
			this.tick = tick;
		}

		public function createStrings():Array{
			var widthLimit:Number = cellRectangleWidth - paddingLeft - paddingRight;
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, widthLimit, fontSize, baseFont, tick);
			var strings:Array = wrapStringsMaker.separateToStrings();

			return strings;
		}

		public function toStreamValue():String{
			var strings:Array = createStrings();

			var streamValue:String = "";
			for(var i:int = 0 ; i < strings.length ; i++){
				var rectangle:Rectangle = new Rectangle(positionX, positionY - cellRectangleHeight * i, cellRectangleWidth, cellRectangleHeight);
				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, null, null, false);
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(strings[i], fontSize, baseFont, textFilledColor, rectangle);
				rectangleTextContent.paddingLeft = paddingLeft;
				rectangleTextContent.paddingRight = paddingRight;
				rectangleTextContent.horizontalAlign = horizontalAlign;
				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
				streamValue += rectangleText.toStreamValue();
			}
			return streamValue;
		}

		public function getBaseFont():BaseFont{
			return this.baseFont;
		}

	}
}

