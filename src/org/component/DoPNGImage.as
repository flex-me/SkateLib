package org.component
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;

	public final class DoPNGImage extends PNGImage
	{
		protected var bitmap:BitmapData;

		public function DoPNGImage( buffer:BitmapData, imageStream:ByteArray)
		{
			bitmap = buffer;
			idataBytes = imageStream;
			super(imageStream, ColorSpace.DEVICE_RGB);
		}

		protected override function parse():void
		{
			_width = bitmap.width;
			_height = bitmap.height;
			_parameters = '/DecodeParms <</Predictor 15 /Colors 3 /BitsPerComponent '+bitsPerComponent+' /Columns '+width+'>>';
		}	
	}
}

