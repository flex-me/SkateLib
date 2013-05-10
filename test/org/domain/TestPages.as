package org.domain
{
	import flash.utils.ByteArray;

	import flexunit.framework.Assert;

	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;

	public class TestPages
	{
		[Test]
		public function testGetCurrentPage():void{
			var pages:Pages = new Pages();
			Assert.assertNull(pages.getCurrentPage());
			pages.addPage(new Page());
			Assert.assertNotNull(pages.getCurrentPage());
		}

		[Test]
		public function testCreateNewPages():void{
			var pages:Pages = new Pages();
			Assert.assertEquals(1, pages.objectNumber);
			Assert.assertEquals(1, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}

		[Test]
		public function testToPdfObject():void{
			var pages:Pages = new Pages();
			var page:Page = new Page();
			pages.addPage(page);
			var pdfObject:PdfObject = pages.selfToPdfObject();
			var expectedPdfObject:PdfObject = new PdfObject();
			expectedPdfObject.objectNumber = 1;
			expectedPdfObject.string = "1 0 obj" + Writer.endOfLine + 
				"<</Type /Pages" + Writer.endOfLine + 
				"/Kids [2 0 R]" + Writer.endOfLine + 
				"/Count 1>>" + Writer.endOfLine + 
				"endobj" + Writer.endOfLine;
			expectedPdfObject.byteArray = new ByteArray();
			expectedPdfObject.byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);

			Assert.assertTrue(expectedPdfObject.equals(pdfObject));

			Assert.assertEquals(2, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}

		[Test]
		public function testCreateObjectReferencesString():void{
			var pageList:Array = [new Page(), new Page()];
			var objectReferencesString:String = Pages.createObjectReferencesString(pageList);
			Assert.assertEquals("1 0 R 2 0 R", objectReferencesString);
			Assert.assertEquals(2, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}
	}
}















