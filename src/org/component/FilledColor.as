package org.component
{
	import org.domain.RgbColor;
	import org.main.Writer;
	import org.util.StringTool;

	public class FilledColor implements Component
	{
		private var rgbColor:RgbColor;

		public function FilledColor(rgbColor:RgbColor)
		{
			this.rgbColor = rgbColor;
		}

		public function toStreamValue():String{
			return StringTool.setValue("{0} {1} {2} rg", [rgbColor.red, rgbColor.green, rgbColor.blue]) + Writer.endOfLine;
		}

	}
}

