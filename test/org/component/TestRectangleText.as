package org.component
{
	import flexunit.framework.Assert;

	import org.domain.RgbColor;
	import org.main.Writer;

	public class TestRectangleText
	{
		[Test]
		public function testToStreamValue():void{
//			var rectangleText:RectangleText = new RectangleText(new Rectangle(100, 600, 400, 100), "Hello World", 36, RgbColor.White, RgbColor.Black, RgbColor.White);

			var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(new Rectangle(100, 600, 400, 100), RgbColor.White, RgbColor.White);
			var rectangleTextContent:RectangleTextContent = new RectangleTextContent("Hello World", 36, null, RgbColor.Black, new Rectangle(100, 600, 400, 100));
			var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);



			var streamValue:String = rectangleText.toStreamValue();
			var expectedStreamValue:String = "";
			expectedStreamValue += "1 1 1 RG" + Writer.endOfLine;
			expectedStreamValue += "1 1 1 rg" + Writer.endOfLine;
			expectedStreamValue += "100 600 400 100 re" + Writer.endOfLine;
			expectedStreamValue += "B" + Writer.endOfLine;
			expectedStreamValue += "0 0 0 rg" + Writer.endOfLine;
			expectedStreamValue += "BT" + Writer.endOfLine;
			expectedStreamValue += "/F5 36 Tf" + Writer.endOfLine;
			expectedStreamValue += "100 639.2 Td" + Writer.endOfLine;
			expectedStreamValue += "(Hello World) Tj" + Writer.endOfLine;
			expectedStreamValue += "ET" + Writer.endOfLine;
			Assert.assertEquals(expectedStreamValue, streamValue);
		}

	}
}

