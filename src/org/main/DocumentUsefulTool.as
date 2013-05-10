package org.main
{
	import org.component.Text;
	import org.domain.BaseFont;
	import org.font.FontFactory;
	import org.font.StandardFonts;

	public class DocumentUsefulTool
	{
		public static function textPageEmbedddedFont():Document{
			var document:Document = new Document();
			document.addPage();
			var baseFont:BaseFont = FontFactory.createEmbeddedFont();
			document.addText(new Text("You are welcomeÄ", 72, 720, 12, baseFont));
			return document;
		}
		
		public static function addTextWithFont():Document{
			var document:Document = new Document();
			document.addPage();
			document.addText(new org.component.Text("Hello World", 72, 720, 72));
			document.addText(new org.component.Text("You are welcome", 144, 360, 36, StandardFonts.timesRoman));
			return document;
		}
		
		public static function pages():Document{
			var document:Document = new Document();
			document.addPage();
			document.addPage();
			return document;
		}
	}
}