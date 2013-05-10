package org.component
{
	import flexunit.framework.Assert;

	import org.domain.BaseFont;
	import org.domain.TestContents;
	import org.font.StandardFonts;

	public class TestText
	{
		[Test]
		public function testGetBaseFont():void{
			var text:Text = new Text("abc", 10, 10, 12);
			var baseFont:BaseFont = text.getBaseFont();
			Assert.assertEquals(StandardFonts.helvetica.fontName, baseFont.fontName);
			Assert.assertEquals(StandardFonts.helvetica.shortFontName, baseFont.shortFontName);
		}

		[Test]
		public function testTextToStreamValue():void{
			var streamValue:String = new Text("Hello World", 72, 720, 72, StandardFonts.timesRoman).toStreamValue();
			Assert.assertEquals(TestContents.expectedStreamValue0, streamValue);
		}

		[Test]
		public function testTextToStreamValueWithoutBaseFont():void{
			var streamValue:String = new Text("You are welcome", 144, 360, 36).toStreamValue();
			Assert.assertEquals(TestContents.expectedStreamValue1, streamValue);
		}

	}
}

