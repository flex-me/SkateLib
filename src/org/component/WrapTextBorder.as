package org.component
{
	import org.domain.RgbColor;

	//Refactor: should support visible. 
	public class WrapTextBorder
	{
		private var cellRectangleWidth:Number;
		private var cellRectangleHeight:Number;
		private var positionX:Number;
		private var positionY:Number;
		private var borderColor:RgbColor = RgbColor.White;
		private var filledColor:RgbColor = RgbColor.White;

		private var stringsLength:int;

		public var visibleBorder:Boolean = true;

		public function WrapTextBorder(cellRectangleWidth:Number, cellRectangleHeight:Number, positionX:Number, positionY:Number, 
			borderColor:RgbColor, filledColor:RgbColor, stringsLength:int, visibleBorder:Boolean=true)
		{
			this.cellRectangleWidth = cellRectangleWidth;
			this.cellRectangleHeight = cellRectangleHeight;
			this.positionX = positionX;
			this.positionY = positionY;
			this.borderColor = borderColor;
			this.filledColor = filledColor;
			this.stringsLength = stringsLength;
			this.visibleBorder = visibleBorder;
		}

		public function toStreamValue():String{
			if(visibleBorder == false){
				return "";
			}

			var streamValue:String = "";
			streamValue += new StrokeColor(borderColor).toStreamValue();
			streamValue += new FilledColor(filledColor).toStreamValue();
			var borderRectangle:Rectangle = getBorderRectangle();
			streamValue += borderRectangle.toStreamValue();
			return streamValue;
		}

		public function getBorderRectangle():Rectangle{
			return new Rectangle(
				positionX, 
				positionY - cellRectangleHeight * (stringsLength - 1), 
				cellRectangleWidth, 
				cellRectangleHeight * stringsLength);
		}

	}
}

