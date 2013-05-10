package org.domain
{
	import flexunit.framework.Assert;

	public class TestRgbColor
	{
		[Test]
		public function testHexStringToRGBColor():void{
			var rgbColor:RgbColor = RgbColor.hexStringToRGBColor("#FFFFFF");
			Assert.assertEquals(1, rgbColor.red);
			Assert.assertEquals(1, rgbColor.green);
			Assert.assertEquals(1, rgbColor.blue);
		}

		[Test]
		public function testHexStringToRGBColorMore():void{
			var rgbColor:RgbColor = RgbColor.hexStringToRGBColor("0xFFFFFF");
			Assert.assertEquals(1, rgbColor.red);
			Assert.assertEquals(1, rgbColor.green);
			Assert.assertEquals(1, rgbColor.blue);
		}
	}
}

