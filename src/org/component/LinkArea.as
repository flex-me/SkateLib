package org.component
{
	import org.main.Writer;
	import org.util.StringTool;

	public class LinkArea
	{
		public var rectangle:Rectangle;
		public var link:String;

		public function LinkArea(rectangle:Rectangle, link:String)
		{
			this.rectangle = rectangle;
			this.link = link;
		}

		public function toStreamValue():String{
			var streamValue:String = "";
			streamValue += "<</Type /Annot" + Writer.endOfLine;
			streamValue += "/Subtype /Link" + Writer.endOfLine;
			streamValue += StringTool.setValue("/Rect [{0} {1} {2} {3}]", [rectangle.x, rectangle.y, rectangle.x + rectangle.width, rectangle.y + rectangle.height]) + Writer.endOfLine;
			streamValue += "/Border [0 0 0]" + Writer.endOfLine;
			streamValue += "/H /I" + Writer.endOfLine;
			streamValue += "/A <<" + Writer.endOfLine;
			streamValue += "/S /URI" + Writer.endOfLine;
			streamValue += StringTool.setValue("/URI ({0})", [link]) + Writer.endOfLine;
			streamValue += ">>" + Writer.endOfLine;
			streamValue += ">>" + Writer.endOfLine;
			return streamValue;
		}

	}
}

