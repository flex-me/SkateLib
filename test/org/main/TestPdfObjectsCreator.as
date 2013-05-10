package org.main
{
	import app.share.EmbeddedImages;
	
	import flash.utils.ByteArray;
	
	import flexunit.framework.Assert;
	
	import mx.collections.ArrayCollection;
	
	import org.component.Image;
	import org.component.PNGImage;
	import org.domain.ImageXObject;
	import org.mock.ArialFontMockData;
	import org.mock.FontTextPageMockData;
	import org.mock.ImageMockData;
	import org.mock.MockDataCreator;
	import org.mock.OnePageMockData;
	import org.mock.TwoPageMockData;

	public class TestPdfObjectsCreator
	{
		[Test]
		public function testAddImage():void{
			var document:Document = new Document();
			document.addPage();
			var headerImageXObject:ImageXObject = new ImageXObject();
			headerImageXObject.image = new PNGImage(new EmbeddedImages.Header(), "DeviceRGB");
			headerImageXObject.shortXObjectName = "headerImageXObject";
			document.addImage(new Image(headerImageXObject, 28.35, 661.54, 0.3));
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);
			var expectedPdfObjects:ArrayCollection = ImageMockData.createImageMockDataPdfObjects();
			equalsPdfObjects(expectedPdfObjects, pdfObjectsCreator.createPdfObjects());
			//var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 8, 7);
			var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 7, 6);

			Assert.assertTrue(expectedTrailer.equals(pdfObjectsCreator.createTrailer()));			
		}

		[Test]
		public function testAddEmbeddedFont():void{
			var document:Document = DocumentUsefulTool.textPageEmbedddedFont();
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);
			var expectedPdfObjects:ArrayCollection = ArialFontMockData.createArialFontMockDataPdfObjects();
			equalsPdfObjects(expectedPdfObjects, pdfObjectsCreator.createPdfObjects());
			//var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 10, 9);
			var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 9, 8);
			Assert.assertTrue(expectedTrailer.equals(pdfObjectsCreator.createTrailer()));
		}

		[Test]
		public function testAddStandardFont():void{
			var document:Document = DocumentUsefulTool.addTextWithFont();
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);
			var expectedPdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new FontTextPageMockData());
			equalsPdfObjects(expectedPdfObjects, pdfObjectsCreator.createPdfObjects());
			var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 8, 7);
			Assert.assertTrue(expectedTrailer.equals(pdfObjectsCreator.createTrailer()));
		}

		private function equalsPdfObjects(expectedPdfObjects:ArrayCollection, pdfObjects:ArrayCollection):void{
			Assert.assertEquals(expectedPdfObjects.length, pdfObjects.length);
			for(var i:int = 0 ; i < expectedPdfObjects.length ; i++){
				var expectedPdfObject:PdfObject = expectedPdfObjects.getItemAt(i) as PdfObject;
				var pdfObject:PdfObject = pdfObjects.getItemAt(i) as PdfObject;
				Assert.assertTrue(expectedPdfObject.equals(pdfObject));
			}
		}

		[Test]
		public function testAddOnePage():void{
			var document:Document = new Document();
			document.addPage();
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);
			var expectedPdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			equalsPdfObjects(expectedPdfObjects, pdfObjectsCreator.createPdfObjects());
			//var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 7, 6);
			var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 6, 5);
			Assert.assertTrue(expectedTrailer.equals(pdfObjectsCreator.createTrailer()));
		}

		[Test]
		public function testAddTwoPage():void{
			var document:Document = DocumentUsefulTool.pages();
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);

			var expectedPdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new TwoPageMockData());
			equalsPdfObjects(expectedPdfObjects, pdfObjectsCreator.createPdfObjects());
			//var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 9, 8);
			var expectedTrailer:Trailer = MockDataCreator.createTrailer(expectedPdfObjects, 8, 7);
			Assert.assertTrue(expectedTrailer.equals(pdfObjectsCreator.createTrailer()));
		}

		public static function equalsArray(expectedArray:Array, array:Array):void{
			Assert.assertEquals(expectedArray.length, array.length);
			for(var i:int = 0 ; i < expectedArray.length ; i++){
				Assert.assertEquals(expectedArray[i], array[i]);
			}
		}

		public static function equalsByteArray(expectedByteArray:ByteArray, byteArray:ByteArray):void{
			Assert.assertEquals(expectedByteArray.length, byteArray.length);
			for(var i:int = 0 ; i < expectedByteArray.length ; i++){
				Assert.assertEquals(expectedByteArray[i], byteArray[i]);				
			}
		}

	}
}

