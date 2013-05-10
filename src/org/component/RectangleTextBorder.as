package org.component
{
	import org.domain.RgbColor;

	public class RectangleTextBorder
	{
		private var rectangle:Rectangle;
		private var rectangleFilledColor:RgbColor;
		private var rectangleStrokeColor:RgbColor;
		private var visible:Boolean;

		public function RectangleTextBorder(rectangle:Rectangle, rectangleFilledColor:RgbColor, rectangleStrokeColor:RgbColor, visible:Boolean=true)
		{
			this.rectangle = rectangle;
			this.rectangleFilledColor = rectangleFilledColor;
			this.rectangleStrokeColor = rectangleStrokeColor;
			this.visible = visible;
		}

		public function toStreamValue():String{
			if(visible == false){
				return "";
			}

			var streamValue:String = "";
			if(rectangleFilledColor == null){
				rectangleFilledColor = RgbColor.White;
			}
			if(rectangleStrokeColor == null){
				rectangleStrokeColor = RgbColor.Black;
			}
			streamValue += new StrokeColor(rectangleStrokeColor).toStreamValue();
			streamValue += new FilledColor(rectangleFilledColor).toStreamValue();
			streamValue += rectangle.toStreamValue();
			return streamValue;
		}

	}
}

