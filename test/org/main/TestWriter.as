package org.main
{
	import flash.utils.ByteArray;

	import flexunit.framework.Assert;

	import mx.collections.ArrayCollection;

	import org.mock.MockDataCreator;
	import org.mock.OnePageMockData;

	public class TestWriter
	{

		[Test]
		public function testGenerateFromByteArrays():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var trailer:Trailer = MockDataCreator.createTrailer(pdfObjects, 7, 6);
			var writer:Writer = new Writer(pdfObjects, trailer);
			var byteArray:ByteArray = writer.generateFromByteArrays();
			var expectedByteArray:ByteArray = MockDataCreator.getOnePagePdf();
			TestPdfObjectsCreator.equalsByteArray(expectedByteArray, byteArray);
		}

		[Test]
		public function testCreateObjectsPartFromByteArrays():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var objectsPartByteArray:ByteArray = Writer.createObjectsPartFromByteArrays(pdfObjects);
			var expectedObjectsPart:String = MockDataCreator.xmlToPureContent(MockDataCreator.getOnePageObjectsPartXml());
			var expectedObjectPartByteArray:ByteArray = new ByteArray();
			expectedObjectPartByteArray.writeMultiByte(expectedObjectsPart, Writer.defaultCharSet);
			TestPdfObjectsCreator.equalsByteArray(expectedObjectPartByteArray, objectsPartByteArray);
		}

		[Test]
		public function testCreateCrossReferencePart():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());

			var trailer:Trailer = MockDataCreator.createTrailer(pdfObjects, 7, 6);
			var crossReferencePart:String = Writer.createCrossReferencePart(pdfObjects, trailer);

			var expectedCrossReferencePart:String = MockDataCreator.xmlToPureContent(MockDataCreator.onePageCrossReferencePartXml);
			Assert.assertEquals(expectedCrossReferencePart, crossReferencePart);
		}

		[Test]
		public function testCreateCrossReferenceEntries():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());

			var crossReferenceEntries:Array = Writer.createCrossReferenceEntries(pdfObjects);
			var expectedCrossReferenceEntries:Array = new Array();
			expectedCrossReferenceEntries.push("0000000000 65535 f ");
			expectedCrossReferenceEntries.push("0000000009 00000 n ");
			expectedCrossReferenceEntries.push("0000000064 00000 n ");
			expectedCrossReferenceEntries.push("0000000228 00000 n ");
			expectedCrossReferenceEntries.push("0000000182 00000 n ");
			expectedCrossReferenceEntries.push("0000000355 00000 n ");
			expectedCrossReferenceEntries.push("0000000437 00000 n ");
			TestPdfObjectsCreator.equalsArray(expectedCrossReferenceEntries, crossReferenceEntries);
		}

		[Test]
		public function testPrefixZerosTo():void{
			Assert.assertEquals("0000000001", Writer.prefixZerosTo(1));
		}

		[Test]
		public function testCreatePdfObjectOffsetsByAscendObjectNumber():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var pdfObjectOffsets:Array = Writer.createPdfObjectOffsetsByAscendObjectNumber(pdfObjects);
			var expectedPdfObjectOffsets:Array = [0, 9, 64, 228, 182, 355, 437];
			TestPdfObjectsCreator.equalsArray(expectedPdfObjectOffsets, pdfObjectOffsets);
		}

		[Test]
		public function testGetPdfObjectOffset():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = 2;
			var pdfObjectOffset:int = Writer.getPdfObjectOffset(pdfObjects, pdfObject);
			Assert.assertEquals(64, pdfObjectOffset);
		}

		[Test]
		public function testFindPdfObjectByObjectNumber():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var pdfObject:PdfObject = Writer.findPdfObjectByObjectNumber(pdfObjects, 2);
			var expectedPdfObject:PdfObject = new PdfObject();
			expectedPdfObject.objectNumber = 2;
			expectedPdfObject.string = MockDataCreator.xmlToPureContent(<Content>
					<![CDATA[2 0 obj
<</Type /Page
/Parent 1 0 R
/MediaBox [0 0 595.28 841.89]
/Resources 3 0 R
/Rotate 0
/Contents 4 0 R>>
endobj
]]>
				</Content>);
			Assert.assertEquals(expectedPdfObject.objectNumber, pdfObject.objectNumber);
			Assert.assertEquals(expectedPdfObject.toString(), pdfObject.toString());
		}

		[Test]
		public function testCreateCrossReferenceCountInfo():void{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new OnePageMockData());
			var crossReferenceCountInfo:Array = Writer.createCrossReferenceCountInfo(pdfObjects);
			var expectedCrossReferenceCountInfo:Array = ["xref", "0 7"];
			TestPdfObjectsCreator.equalsArray(expectedCrossReferenceCountInfo, crossReferenceCountInfo);
		}
	}
}

