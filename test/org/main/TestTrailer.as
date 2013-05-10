package org.main
{
	import flexunit.framework.Assert;

	import mx.collections.ArrayCollection;

	import org.mock.MockDataCreator;
	import org.mock.OnePageMockData;

	public class TestTrailer{

		[Test]
		public function testGetXrefOffset():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var trailer:Trailer = MockDataCreator.createTrailer(pdfObjects, 5, 4);
			var xrefOffset:int = trailer.getXrefOffset();
			Assert.assertEquals(560, xrefOffset);
		}

		[Test]
		public function testGetPdfObjectsCount():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var pdfObjectsCount:int = Trailer.getPdfObjectsCount(pdfObjects);
			Assert.assertEquals(7, pdfObjectsCount);
		}
	}
}

