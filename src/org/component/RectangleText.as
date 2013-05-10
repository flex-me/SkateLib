package org.component
{
	import org.domain.BaseFont;
	import org.domain.Contents;
	import org.domain.RgbColor;

	public class RectangleText implements Component
	{

		public function RectangleText(rectangleTextBorder:RectangleTextBorder, rectangleTextContent:RectangleTextContent)
		{
			this.rectangleTextBorder = rectangleTextBorder;
			this.rectangleTextContent = rectangleTextContent;
		}

		public var rectangleTextBorder:RectangleTextBorder;
		public var rectangleTextContent:RectangleTextContent;

		public function toStreamValue():String{
			var streamValue:String = "";
			streamValue += rectangleTextBorder.toStreamValue();
			streamValue += rectangleTextContent.toStreamValue();
			return streamValue;
		}

		public function getBaseFont():BaseFont{
			return rectangleTextContent.getBaseFont();
		}

	}
}

