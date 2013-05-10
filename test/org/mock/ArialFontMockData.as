package org.mock
{
	import app.TestFontFile;

	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.PdfObject;
	import org.main.Writer;

	public class ArialFontMockData implements MockData
	{
		public static function createArialFontMockDataPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new ArialFontMockData());
			pdfObjects.addItemAt(ArialFontMockData.createFontFile2PdfObject(), 6);
			return pdfObjects;
		}

		private static function createFontFile2PdfObject():PdfObject{
			var fontStreamArial:ByteArray = new TestFontFile.FontStreamArial();
			fontStreamArial.compress();
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeMultiByte("7 0 obj" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeMultiByte("<</Length 197865" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeMultiByte("/Filter /FlateDecode" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeMultiByte("/Length1 367112>>" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeMultiByte("stream" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeBytes(fontStreamArial);
			byteArray.writeMultiByte("endstream" + Writer.endOfLine, Writer.defaultCharSet);
			byteArray.writeMultiByte("endobj" + Writer.endOfLine, Writer.defaultCharSet);

			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = 7;
			pdfObject.string = "";
			pdfObject.byteArray = byteArray;
			return pdfObject;
		}

//		public function createObjectNumbers():Array{
//			return [1, 2, 4, 3, 6, 7, 9, 10];
//		}
//
//		public function createObjectXmls():Array{
//			var objectXmls:Array = new Array();
//			objectXmls.push(<Content>
//					<![CDATA[1 0 obj
//<</Type /Pages
///Kids [2 0 R]
///Count 1>>
//endobj
//]]>
//				</Content>);
//			objectXmls.push(<Content>
//					<![CDATA[2 0 obj
//<</Type /Page
///Parent 1 0 R
///MediaBox [0 0 595.28 841.89]
///Resources 3 0 R
///Rotate 0
///Contents 4 0 R>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[4 0 obj
//<</Length 53>>
//stream
//BT
///ArialMT 12 Tf
//72 720 Td
//(You are welcomeÄ) Tj
//ET
//endstream
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[3 0 obj
//<<
///ProcSet [/PDF /Text /ImageB /ImageC /ImageI]
///Font <<
///F5 5 0 R
///ArialMT 6 0 R
//>>
///XObject <<
//>>
///ColorSpace <<
//>>
///Shading <<
//>>
//>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[5 0 obj
//<</Type /Font
///BaseFont /Helvetica
///Subtype /Type1
///Encoding /WinAnsiEncoding
//>>
//endobj
//]]>
//				</Content>);
//
//
//			objectXmls.push(<Content>
//					<![CDATA[6 0 obj
//<</Type /Font
///BaseFont /ArialMT
///Subtype /TrueType
///FirstChar 32
///LastChar 255
///Widths [278 278 355 556 556 889 667 191 333 333 389 584 278 333 278 278 556 556 556 556 556 556 556 556 556 556 278 278 584 584 584 556 1015 667 667 722 722 667 611 778 722 278 500 667 556 833 722 778 667 778 722 667 611 722 667 944 667 667 611 278 278 278 469 556 333 556 556 500 556 556 278 556 556 222 222 500 222 833 556 556 556 556 333 500 278 556 500 722 500 500 500 334 260 334 584 750 556 750 222 556 333 1000 556 556 333 1000 667 333 1000 750 611 750 750 222 222 333 333 350 556 1000 333 1000 500 333 944 750 500 667 278 333 556 556 556 556 260 556 333 737 370 556 584 333 737 333 400 549 333 333 333 576 537 278 333 333 365 556 834 834 834 611 667 667 667 667 667 667 1000 722 667 667 667 667 278 278 278 278 722 722 778 778 778 778 778 584 778 722 722 722 722 667 667 611 556 556 556 556 556 556 889 500 556 556 556 556 278 278 278 278 556 556 556 556 556 556 556 549 611 556 556 556 556 500 556 500]
///FontDescriptor 7 0 R
///Encoding /WinAnsiEncoding
//>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[7 0 obj
//<</Type /FontDescriptor
///FontName /ArialMT
///FontWeight /Regular
///Descent -212
///Ascent 905
///AvgWidth 750
///Flags 32
///FontBBox [-664 -325 2000 1006]
///ItalicAngle 0
///StemV 70
///MissingWidth 750
///CapHeight 716
///FontFile2 8 0 R
//>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[9 0 obj
//<<
///Producer (AlivePDF 0.1.5 RC)
///CreationDate (D:201009251322)
//>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[10 0 obj
//<<
///Type /Catalog
///Pages 1 0 R
///OpenAction [2 0 R /FitH null]
///PageLayout /SinglePage
///PageMode /UseNone
//>>
//endobj
//]]>
//				</Content>);
//			return objectXmls;
//		}

		public function createObjectNumbers():Array{
			return [1, 2, 4, 3, 5, 6, 8, 9];
		}

		public function createObjectXmls():Array{
			var objectXmls:Array = new Array();
			objectXmls.push(<Content>
					<![CDATA[1 0 obj
<</Type /Pages
/Kids [2 0 R]
/Count 1>>
endobj
]]>
				</Content>);
			objectXmls.push(<Content>
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

			objectXmls.push(<Content>
					<![CDATA[4 0 obj
<</Length 53>>
stream
BT
/ArialMT 12 Tf
72 720 Td
(You are welcomeÄ) Tj
ET
endstream
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[3 0 obj
<<
/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]
/Font <<
/ArialMT 5 0 R
>>
/XObject <<
>>
/ColorSpace <<
>>
/Shading <<
>>
>>
endobj
]]>
				</Content>);

//			objectXmls.push(<Content>
//					<![CDATA[5 0 obj
//<</Type /Font
///BaseFont /Helvetica
///Subtype /Type1
///Encoding /WinAnsiEncoding
//>>
//endobj
//]]>
//				</Content>);


			objectXmls.push(<Content>
					<![CDATA[5 0 obj
<</Type /Font
/BaseFont /ArialMT
/Subtype /TrueType
/FirstChar 32
/LastChar 255
/Widths [278 278 355 556 556 889 667 191 333 333 389 584 278 333 278 278 556 556 556 556 556 556 556 556 556 556 278 278 584 584 584 556 1015 667 667 722 722 667 611 778 722 278 500 667 556 833 722 778 667 778 722 667 611 722 667 944 667 667 611 278 278 278 469 556 333 556 556 500 556 556 278 556 556 222 222 500 222 833 556 556 556 556 333 500 278 556 500 722 500 500 500 334 260 334 584 750 556 750 222 556 333 1000 556 556 333 1000 667 333 1000 750 611 750 750 222 222 333 333 350 556 1000 333 1000 500 333 944 750 500 667 278 333 556 556 556 556 260 556 333 737 370 556 584 333 737 333 400 549 333 333 333 576 537 278 333 333 365 556 834 834 834 611 667 667 667 667 667 667 1000 722 667 667 667 667 278 278 278 278 722 722 778 778 778 778 778 584 778 722 722 722 722 667 667 611 556 556 556 556 556 556 889 500 556 556 556 556 278 278 278 278 556 556 556 556 556 556 556 549 611 556 556 556 556 500 556 500]
/FontDescriptor 6 0 R
/Encoding /WinAnsiEncoding
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[6 0 obj
<</Type /FontDescriptor
/FontName /ArialMT
/FontWeight /Regular
/Descent -212
/Ascent 905
/AvgWidth 750
/Flags 32
/FontBBox [-664 -325 2000 1006]
/ItalicAngle 0
/StemV 70
/MissingWidth 750
/CapHeight 716
/FontFile2 7 0 R
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[8 0 obj
<<
/Producer (AlivePDF 0.1.5 RC)
/CreationDate (D:201009251322)
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[9 0 obj
<<
/Type /Catalog
/Pages 1 0 R
/OpenAction [2 0 R /FitH null]
/PageLayout /SinglePage
/PageMode /UseNone
>>
endobj
]]>
				</Content>);
			return objectXmls;
		}
	}
}

