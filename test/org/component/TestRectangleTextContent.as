package org.component
{
	import flexunit.framework.Assert;

	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.font.StandardFonts;

	public class TestRectangleTextContent
	{
		[Test]
		public function testGetTextFilledColor():void{
			var rectangleTextContent:RectangleTextContent = new RectangleTextContent("abc", 12, null, null, null);
			var textFilledColor:RgbColor = rectangleTextContent.getTextFilledColor();
			Assert.assertTrue(RgbColor.Black.equals(textFilledColor));			
		}

		[Test]
		public function testGetBaseFont():void{
			var rectangleTextContent:RectangleTextContent = new RectangleTextContent("abc", 12, null, null, null);
			var baseFont:BaseFont = rectangleTextContent.getBaseFont();
			Assert.assertEquals(StandardFonts.helvetica.fontName, baseFont.fontName);
			Assert.assertEquals(StandardFonts.helvetica.shortFontName, baseFont.shortFontName);
		}

		[Test]
		public function testGetVerticalCenteredTextPositionY():void{
			var verticalCenteredTextPositionY:Number = RectangleTextContent.getVerticalCenteredTextPositionY(new Rectangle(0, 0, 100, 100), 12);
			Assert.assertEquals(0 + 100 / 2 - 0.3 * 12, verticalCenteredTextPositionY);
		}

		[Test]
		public function testGetTextHorizontalPositionXWithAlign():void{
			var rectangle:Rectangle = new Rectangle(0, 0, 100, 100);
			var textHorizontalPositionX0:Number = RectangleTextContent.getTextHorizontalPositionXWithAlign(rectangle, 0, 0, "abc", 12, StandardFonts.helvetica, RectangleTextContent.LEFT);
			Assert.assertEquals(0, textHorizontalPositionX0);

			var textHorizontalPositionX1:Number = RectangleTextContent.getTextHorizontalPositionXWithAlign(rectangle, 10, 0, "abc", 12, StandardFonts.helvetica, RectangleTextContent.LEFT);
			Assert.assertEquals(10, textHorizontalPositionX1);
		}

		[Test]
		public function testGetTextHorizontalPositionXWithAlignRight():void{
			var rectangle:Rectangle = new Rectangle(0, 0, 100, 100);
			var textHorizontalPositionX0:Number = RectangleTextContent.getTextHorizontalPositionXWithAlign(rectangle, 0, 0, "abc", 12, StandardFonts.helvetica, RectangleTextContent.RIGHT);
			Assert.assertEquals(80.656, textHorizontalPositionX0);

			var textHorizontalPositionX1:Number = RectangleTextContent.getTextHorizontalPositionXWithAlign(rectangle, 0, 10, "abc", 12, StandardFonts.helvetica, RectangleTextContent.RIGHT);
			Assert.assertEquals(80.656 - 10, textHorizontalPositionX1);
		}

	}
}

