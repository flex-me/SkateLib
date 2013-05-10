package org.component
{
	import org.domain.BaseFont;
	import org.font.StandardFonts;
	import org.main.Writer;
	import org.util.StringTool;

	public class Text implements Component
	{
		private var string:String;
		private var positionX:Number;
		private var positionY:Number;
		private var fontSize:int;
		private var baseFont:BaseFont;

		public function Text(string:String, positionX:Number, positionY:Number, fontSize:int, baseFont:BaseFont=null)
		{
			this.string = string;
			this.positionX = positionX;
			this.positionY = positionY;
			this.fontSize = fontSize;
			this.baseFont = (baseFont == null)? StandardFonts.helvetica : baseFont;
		}

		public function getBaseFont():BaseFont{
			return baseFont;
		}

		public function toStreamValue():String{
			var streamValue:String = "BT" + Writer.endOfLine;
			streamValue += StringTool.setValue("/{0} {1} Tf", [baseFont.shortFontName, fontSize]) + Writer.endOfLine;
			streamValue += StringTool.setValue("{0} {1} Td", [positionX, positionY]) + Writer.endOfLine;
			streamValue += StringTool.setValue("({0}) Tj", [string]) + Writer.endOfLine;
			streamValue += "ET" + Writer.endOfLine;
			return streamValue;
		}
	}
}

