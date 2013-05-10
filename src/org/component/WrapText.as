package org.component
{
	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.util.WrapStringsMaker;

	//Refactor: if the string is XXXXXXXXXXXXXXXXXXXXXXX, how to wrap? 
	public class WrapText implements Component
	{

		public function WrapText()
		{
		}

		public var wrapTextContent:WrapTextContent;
		public var wrapTextBorder:WrapTextBorder;

		public function toStreamValue():String{
			var streamValue:String = "";
			streamValue += wrapTextBorder.toStreamValue();
			streamValue += wrapTextContent.toStreamValue();
			return streamValue;
		}

		public function getBaseFont():BaseFont{
			return wrapTextContent.getBaseFont();
		}

	}
}

