package org.domain
{

	public class PaperSize
	{
		public static var A4:PaperSize = new PaperSize(595.28, 841.89);

		public var width:Number;
		public var height:Number;

		public function PaperSize(width:Number, height:Number)
		{
			this.width = width;
			this.height = height;
		}

	}
}

