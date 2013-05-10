package org.font
{
	import app.TestFontFile;

	import flash.utils.ByteArray;

	import org.domain.BaseFont;
	import org.domain.FontDescriptor;
	import org.domain.FontFile2;

	public class FontFactory
	{
		//Refactor: should extract the fontName and fontStreamArial as parameters, 
		//when add a new embedded font. 
		public static function createEmbeddedFont():BaseFont{
			var embeddedFont:org.domain.EmbededFont = new org.domain.EmbededFont();
			embeddedFont.fontName = "ArialMT";
			embeddedFont.shortFontName = "ArialMT";
			var fontDescriptor:FontDescriptor = new FontDescriptor();
			var fontFile2:FontFile2 = new FontFile2();
			var fontStreamArial:ByteArray = new TestFontFile.FontStreamArial();
			fontStreamArial.compress();
			fontFile2.fontStreamArial = fontStreamArial;
			fontDescriptor.fontFile2 = fontFile2;
			embeddedFont.fontDescriptor = fontDescriptor;
			return embeddedFont;
		}
	}
}

