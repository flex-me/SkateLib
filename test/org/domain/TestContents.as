package org.domain
{
	import flash.utils.ByteArray;

	import flexunit.framework.Assert;

	import org.component.Text;
	import org.font.StandardFonts;
	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;

	public class TestContents
	{
		public static const expectedStreamValue0:String = "BT" + Writer.endOfLine + 
			"/" + StandardFonts.timesRoman.shortFontName + " 72 Tf" + Writer.endOfLine + 
			"72 720 Td" + Writer.endOfLine + 
			"(Hello World) Tj" + Writer.endOfLine + 
			"ET" + Writer.endOfLine;

		public static const expectedStreamValue1:String = "BT" + Writer.endOfLine + 
			"/" + StandardFonts.helvetica.shortFontName + " 36 Tf" + Writer.endOfLine + 
			"144 360 Td" + Writer.endOfLine + 
			"(You are welcome) Tj" + Writer.endOfLine + 
			"ET" + Writer.endOfLine;

		[Test]
		public function testAddText():void{
			var contents:Contents = new Contents();
//			Assert.assertEquals(0, contents.streamValues.length);

			contents.addText(new Text("Hello World", 72, 720, 72, StandardFonts.timesRoman));
			contents.addText(new Text("You are welcome", 144, 360, 36));

//			Assert.assertEquals(2, contents.streamValues.length);
//			Assert.assertEquals(expectedStreamValue0, contents.streamValues[0]);
//			Assert.assertEquals(expectedStreamValue1, contents.streamValues[1]);			

			Assert.assertEquals(2, contents.components.length);
			Assert.assertEquals(expectedStreamValue0, contents.components[0].toStreamValue());
			Assert.assertEquals(expectedStreamValue1, contents.components[1].toStreamValue());
		}


		[Test]
		public function testToPdfObject():void{
			var contents:Contents = new Contents();
			var pdfObject:PdfObject = contents.selfToPdfObject();

			var expectedPdfObject:PdfObject = new PdfObject();
			expectedPdfObject.objectNumber = 1;
			expectedPdfObject.string = "1 0 obj" + Writer.endOfLine + 
				"<</Length 0>>" + Writer.endOfLine + 
				"stream" + Writer.endOfLine + 
				"endstream" + Writer.endOfLine + 
				"endobj" + Writer.endOfLine;
			expectedPdfObject.byteArray = new ByteArray();
			expectedPdfObject.byteArray.writeMultiByte(expectedPdfObject.string, Writer.defaultCharSet);
			Assert.assertTrue(expectedPdfObject.equals(pdfObject));
//			var streamValues:Array = new Array();
//			streamValues.push(expectedStreamValue0);
//			streamValues.push(expectedStreamValue1);
//			contents.streamValues = streamValues;

			var components:Array = new Array();
			components.push(new Text("Hello World", 72, 720, 72, StandardFonts.timesRoman));
			components.push(new Text("You are welcome", 144, 360, 36));

			contents.components = components;

			pdfObject = contents.selfToPdfObject();
			expectedPdfObject.string = "1 0 obj" + Writer.endOfLine + 
				"<</Length 91>>" + Writer.endOfLine + 
				"stream" + Writer.endOfLine + 
				expectedStreamValue0 + 
				expectedStreamValue1 + 
				"endstream" + Writer.endOfLine + 
				"endobj" + Writer.endOfLine;
			expectedPdfObject.byteArray = new ByteArray();
			expectedPdfObject.byteArray.writeMultiByte(expectedPdfObject.string, Writer.defaultCharSet);
			Assert.assertTrue(expectedPdfObject.equals(pdfObject));
			Assert.assertEquals(1, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}
	}
}

