package org.component
{
	import org.domain.RgbColor;
	import org.main.Writer;
	import org.util.StringTool;

	public class StrokeColor implements Component
	{
		private var rgbColor:RgbColor;

		public function StrokeColor(rgbColor:RgbColor)
		{
			this.rgbColor = rgbColor;
		}

		public function toStreamValue():String{
			return StringTool.setValue("{0} {1} {2} RG", [rgbColor.red, rgbColor.green, rgbColor.blue]) + Writer.endOfLine;
		}

		public function equals(strokeColor:StrokeColor):Boolean{
			return this.toStreamValue() == strokeColor.toStreamValue();
		}

	}
}

