package org.component
{
	import app.share.EmbeddedImages;

	import flexunit.framework.Assert;

	public class TestPNGImage{

		[Test]
		public function testGetImageWidthAndHeight():void{
			var image:PDFImage = new PNGImage(new EmbeddedImages.BannerFrontPage(), "DeviceRGB");
			Assert.assertEquals(1440, image.width);
			Assert.assertEquals(345, image.height);
		}
	}
}

