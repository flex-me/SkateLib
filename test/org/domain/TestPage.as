package org.domain
{
	import flexunit.framework.Assert;

	import org.component.LinkArea;
	import org.main.Writer;

	public class TestPage
	{
		[Test]
		public function testSetPaperSize():void{
			var page:Page = new Page();
			var paperSize:PaperSize = page.paperSize;
			Assert.assertEquals(595.28, paperSize.width);
			Assert.assertEquals(841.89, paperSize.height);
			Assert.assertEquals("/MediaBox [0 0 595.28 841.89]" + Writer.endOfLine, page.createMediaBoxValue());
		}

		[Test]
		public function testAddLineArea():void{
			var page:Page = new Page();
			var rectangle:org.component.Rectangle = new org.component.Rectangle(100, 100, 200, 100);
			var linkArea:LinkArea = new LinkArea(rectangle, "http://www.baidu.com");
			page.addLinkArea(linkArea);
			Assert.assertEquals(1, page.linkAreas.length);
		}

		[Test]
		public function testCreateAnnotsStreamValue():void{
			var linkArea0:LinkArea = new LinkArea(new org.component.Rectangle(100, 100, 200, 100), "http://www.baidu.com");		
			var linkArea1:LinkArea = new LinkArea(new org.component.Rectangle(100, 100, 200, 500), "http://www.google.com");
			var linkAreas:Array = new Array();
			linkAreas.push(linkArea0);
			linkAreas.push(linkArea1);
			var annotsStreamValue:String = Page.createAnnotsStreamValue(linkAreas);

			var expectedAnnotsStreamValue:String = "";
			expectedAnnotsStreamValue += "/Annots [" + Writer.endOfLine;

			expectedAnnotsStreamValue += "<</Type /Annot" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Subtype /Link" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Rect [100 100 300 200]" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Border [0 0 0]" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/H /I" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/A <<" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/S /URI" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/URI (http://www.baidu.com)" + Writer.endOfLine;
			expectedAnnotsStreamValue += ">>" + Writer.endOfLine;
			expectedAnnotsStreamValue += ">>" + Writer.endOfLine;

			expectedAnnotsStreamValue += "<</Type /Annot" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Subtype /Link" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Rect [100 100 300 600]" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/Border [0 0 0]" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/H /I" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/A <<" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/S /URI" + Writer.endOfLine;
			expectedAnnotsStreamValue += "/URI (http://www.google.com)" + Writer.endOfLine;
			expectedAnnotsStreamValue += ">>" + Writer.endOfLine;
			expectedAnnotsStreamValue += ">>" + Writer.endOfLine;

			expectedAnnotsStreamValue += "]" + Writer.endOfLine;

			Assert.assertEquals(expectedAnnotsStreamValue, annotsStreamValue);
		}

	}
}

