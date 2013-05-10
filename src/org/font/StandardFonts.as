package org.font
{
	import org.domain.BaseFont;
	import org.domain.StandardFont;

	public class StandardFonts
	{
		public static function get timesRoman():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Times-Roman";
			baseFont.shortFontName = "F1";			
			return baseFont;
		}

		public static function get timesBold():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Times-Bold";
			baseFont.shortFontName = "F2";			
			return baseFont;
		}

		public static function get timesItalic():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Times-Italic";
			baseFont.shortFontName = "F3";
			return baseFont;
		}

		public static function get timesBoldItalic():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Times-BoldItalic";
			baseFont.shortFontName = "F4";			
			return baseFont;
		}

		public static function get helvetica():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Helvetica";
			baseFont.shortFontName = "F5";
			return baseFont;
		}

		public static function get helveticaBold():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Helvetica-Bold";
			baseFont.shortFontName = "F6";
			return baseFont;
		}		

		public static function get helveticaOblique():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Helvetica-Oblique";
			baseFont.shortFontName = "F7";
			return baseFont;
		}		

		public static function get helveticaBoldOblique():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Helvetica-BoldOblique";
			baseFont.shortFontName = "F8";
			return baseFont;
		}		

		public static function get courier():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Courier";
			baseFont.shortFontName = "F9";
			return baseFont;
		}		

		public static function get courierBold():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Courier-Bold";
			baseFont.shortFontName = "F10";
			return baseFont;
		}		

		public static function get courierOblique():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Courier-Oblique";
			baseFont.shortFontName = "F11";
			return baseFont;
		}		

		public static function get courierBoldOblique():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Courier-BoldOblique";
			baseFont.shortFontName = "F12";
			return baseFont;
		}		

		public static function get symbol():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "Symbol";
			baseFont.shortFontName = "F13";
			return baseFont;
		}				

		public static function get zapfDingbats():BaseFont{
			var baseFont:BaseFont = new StandardFont();
			baseFont.fontName = "ZapfDingbats";
			baseFont.shortFontName = "F14";
			return baseFont;
		}		
	}
}

