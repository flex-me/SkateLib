package org.component
{
	import org.main.Writer;
	import org.util.StringTool;

	public class StrokeWidth implements Component
	{
		private var width:Number;

		public function StrokeWidth(width:Number)
		{
			this.width = width;
		}

		public function toStreamValue():String{
			return StringTool.setValue("{0} w", [width]) + Writer.endOfLine;;
		}

	}
}

