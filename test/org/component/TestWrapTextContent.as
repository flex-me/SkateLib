package org.component
{
	import flexunit.framework.Assert;

	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.main.Writer;

	public class TestWrapTextContent
	{
		[Test]
		public function testCreateStrings():void{
			var string:String = "As a company, \nGoogle focuses on three key are as: " + 
				"access anywhere, any time. \nÀà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß";
			var wrapTextContent:WrapTextContent = new WrapTextContent(string, 12, 520, 20, 50, 700, StandardFonts.helvetica, RgbColor.Black);

			var strings:Array = wrapTextContent.createStrings();
			Assert.assertEquals(3, strings.length);
			Assert.assertEquals("As a company, ", strings[0]);
			Assert.assertEquals("Google focuses on three key are as: access anywhere, any time. ", strings[1]);
			Assert.assertEquals("Àà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß", strings[2]);
		}


		[Test]
		public function testGetBaseFont():void{
			var wrapTextContent:WrapTextContent = new WrapTextContent("", 12, 100, 100, 100, 100, null, null);
			var baseFont:BaseFont = wrapTextContent.getBaseFont();
			Assert.assertEquals(StandardFonts.helvetica.fontName, baseFont.fontName);
			Assert.assertEquals(StandardFonts.helvetica.shortFontName, baseFont.shortFontName);
		}

		[Test]
		public function testToStreamValue():void{
			var string:String = "As a company, \nGoogle focuses on three key are as: " + 
				"access anywhere, any time. \nÀà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß";
			var wrapTextContent:WrapTextContent = new WrapTextContent(string, 12, 520, 20, 50, 700, StandardFonts.helvetica, RgbColor.Black);

			var expectedStreamValue:String = "";
			expectedStreamValue += "0 0 0 rg" + Writer.endOfLine;
			expectedStreamValue += "BT" + Writer.endOfLine;
			expectedStreamValue += "/F5 12 Tf" + Writer.endOfLine;
			expectedStreamValue += "50 706.4 Td" + Writer.endOfLine;
			expectedStreamValue += "(As a company, ) Tj" + Writer.endOfLine;
			expectedStreamValue += "ET" + Writer.endOfLine;
			expectedStreamValue += "0 0 0 rg" + Writer.endOfLine;
			expectedStreamValue += "BT" + Writer.endOfLine;
			expectedStreamValue += "/F5 12 Tf" + Writer.endOfLine;
			expectedStreamValue += "50 686.4 Td" + Writer.endOfLine;
			expectedStreamValue += "(Google focuses on three key are as: access anywhere, any time. ) Tj" + Writer.endOfLine;
			expectedStreamValue += "ET" + Writer.endOfLine;
			expectedStreamValue += "0 0 0 rg" + Writer.endOfLine;
			expectedStreamValue += "BT" + Writer.endOfLine;
			expectedStreamValue += "/F5 12 Tf" + Writer.endOfLine;
			expectedStreamValue += "50 666.4 Td" + Writer.endOfLine;
			expectedStreamValue += "(Àà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß) Tj" + Writer.endOfLine;
			expectedStreamValue += "ET" + Writer.endOfLine;

			Assert.assertEquals(expectedStreamValue, wrapTextContent.toStreamValue());
		}

	}
}

