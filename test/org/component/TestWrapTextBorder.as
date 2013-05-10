package org.component
{
	import flexunit.framework.Assert;

	import org.domain.RgbColor;
	import org.main.Writer;

	public class TestWrapTextBorder
	{
		[Test]
		public function testToStreamValue():void{
			var wrapTextBorder:WrapTextBorder = new WrapTextBorder(200, 100, 100, 100, RgbColor.Black, RgbColor.Yellow, 2);
			var streamValue:String = wrapTextBorder.toStreamValue();

			var expectedStreamValue:String = "";
			expectedStreamValue += "0 0 0 RG" + Writer.endOfLine;
			expectedStreamValue += "1 1 0 rg" + Writer.endOfLine;
			expectedStreamValue += "100 0 200 200 re" + Writer.endOfLine;
			expectedStreamValue += "B" + Writer.endOfLine;

			Assert.assertEquals(expectedStreamValue, streamValue);
		}

		[Test]
		public function testGetBorderRectangle():void{
			var wrapTextBorder:WrapTextBorder = new WrapTextBorder(200, 100, 100, 100, RgbColor.Black, RgbColor.Yellow, 2);
			var borderRectangle:Rectangle = wrapTextBorder.getBorderRectangle();
			var expectedBorderRectangle:Rectangle = new Rectangle(100, 0, 200, 200);
			Assert.assertEquals(expectedBorderRectangle.x, borderRectangle.x);
			Assert.assertEquals(expectedBorderRectangle.y, borderRectangle.y);
			Assert.assertEquals(expectedBorderRectangle.width, borderRectangle.width);
			Assert.assertEquals(expectedBorderRectangle.height, borderRectangle.height);

		}

	}
}

