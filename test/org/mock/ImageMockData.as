package org.mock
{
	import app.share.EmbeddedImages;

	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.component.PDFImage;
	import org.component.PNGImage;
	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.StringTool;

	public class ImageMockData implements MockData
	{
		public static function createImageMockDataPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = MockDataCreator.getPdfObjects(new ImageMockData());
			pdfObjects.addItemAt(ImageMockData.createImageXObjectPdfObject(), 4);
			return pdfObjects;
		}

		public static function createImageXObjectPdfObject():PdfObject{
			var image:PDFImage = new PNGImage(new EmbeddedImages.Header(), "DeviceRGB");
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = 5;
			pdfObject.string = "";
			pdfObject.byteArray = new ByteArray();
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("{0} 0 obj", [pdfObject.objectNumber]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("<</Type /XObject" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("/Subtype /Image" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("/Width {0}", [image.width]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("/Height {0}", [image.height]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("/ColorSpace /{0}", [image.colorSpace]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("/BitsPerComponent {0}", [image.bitsPerComponent]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("/Filter /FlateDecode" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(image.parameters + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte(StringTool.setValue("/Length {0}>>", [image.bytes.length]) + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("stream" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeBytes(image.bytes);
			pdfObject.byteArray.writeMultiByte("endstream" + Writer.endOfLine, Writer.defaultCharSet);
			pdfObject.byteArray.writeMultiByte("endobj" + Writer.endOfLine, Writer.defaultCharSet);
			return pdfObject;
		}

//		public function createObjectNumbers():Array{
//			return [1, 2, 4, 3, 5, 7, 8];
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
//<</Length 58>>
//stream
//q 431.7 0 0 15.6 28.35 661.54 cm
///headerImageXObject Do Q
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
//>>
///XObject <<
///headerImageXObject 6 0 R
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
//					<![CDATA[7 0 obj
//<<
///Producer (AlivePDF 0.1.5 RC)
///CreationDate (D:201009251322)
//>>
//endobj
//]]>
//				</Content>);
//
//			objectXmls.push(<Content>
//					<![CDATA[8 0 obj
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
//
//			return objectXmls;
//		}

		public function createObjectNumbers():Array{
			return [1, 2, 4, 3, 6, 7];
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
<</Length 58>>
stream
q 431.7 0 0 15.6 28.35 661.54 cm
/headerImageXObject Do Q
endstream
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[3 0 obj
<<
/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]
/Font <<
>>
/XObject <<
/headerImageXObject 5 0 R
>>
/ColorSpace <<
>>
/Shading <<
>>
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[6 0 obj
<<
/Producer (AlivePDF 0.1.5 RC)
/CreationDate (D:201009251322)
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[7 0 obj
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

