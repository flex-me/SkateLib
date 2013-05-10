package org.mock
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.domain.Catalog;
	import org.domain.Info;
	import org.main.PdfObject;
	import org.main.Trailer;
	import org.main.Writer;
	import org.util.StringTool;

	public class MockDataCreator{

		public static const defaultNodeName:String = "Content";

		public static function createCdataXml(cdataValue:String):XML{
			return <{defaultNodeName}>{new XML("<![CDATA[" + cdataValue + "]]>")}</{defaultNodeName}>;
		}

		public static function xmlToPureContent(xml:XML):String{
			return StringTool.replaceAll(xml, "\r\n", Writer.endOfLine);
		}

		public static function xmlToByteArray(xml:XML):ByteArray{
			var resultString:String = xmlToPureContent(xml);
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeMultiByte(resultString, Writer.defaultCharSet);
			return byteArray;
		}

		public static function getOnePagePdf():ByteArray{
			var mockPdfXml:XML = createCdataXml(versionPartXml.toString() + getOnePageObjectsPartXml().toString() + onePageCrossReferencePartXml.toString());
			return xmlToByteArray(mockPdfXml);
		}

		private static var versionPartXml:XML = <Content>
				<![CDATA[%PDF-1.5
]]>
			</Content>;

		public static function getOnePageObjectsPartXml():XML{
			var mockData:MockData = new OnePageMockData();
			var objectXmls:Array = mockData.createObjectXmls();

			var content:String = "";
			for each(var objectXml:XML in objectXmls){
				content += objectXml;
			}
			return createCdataXml(content);
		}

		public static var onePageCrossReferencePartXml:XML = <Content>
				<![CDATA[xref
0 7
0000000000 65535 f 
0000000009 00000 n 
0000000064 00000 n 
0000000228 00000 n 
0000000182 00000 n 
0000000355 00000 n 
0000000437 00000 n 
trailer
<<
/Size 7
/Root 7 0 R
/Info 6 0 R
>>
startxref
560
%%EOF
]]>
			</Content>;

		public static function getPdfObjects(mockData:MockData):ArrayCollection{
			var objectNumbers:Array = mockData.createObjectNumbers();
			var objectXmls:Array = mockData.createObjectXmls();

			var pdfObjects:ArrayCollection = initPdfObjects(objectNumbers);
			for(var i:int = 0 ; i < objectXmls.length ; i++){
				var objectXml:XML = objectXmls[i];
				var pdfObject:PdfObject = pdfObjects.getItemAt(i) as PdfObject;
				pdfObject.string = xmlToPureContent(objectXml);

				var byteArray:ByteArray = new ByteArray();
				byteArray.writeMultiByte(pdfObject.string, Writer.defaultCharSet);
				pdfObject.byteArray = byteArray;
			}
			return pdfObjects;
		}

		private static function initPdfObjects(objectNumbers:Array):ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			for each(var objectNumber:int in objectNumbers){
				var pdfObject:PdfObject = new PdfObject();
				pdfObject.objectNumber = objectNumber;
				pdfObjects.addItem(pdfObject);
			}
			return pdfObjects;
		}

		public static function createTrailer(pdfObjects:ArrayCollection, catalogObjectNumber:int, infoObjectNumber:int):Trailer{
			var trailer:Trailer = new Trailer(pdfObjects);
			var catalog:Catalog = new Catalog();
			catalog.setObjectNumber(catalogObjectNumber);
			trailer.catalog = catalog;
			var info:Info = new Info();
			info.setObjectNumber(infoObjectNumber);
			trailer.info = info;
			return trailer;
		}
	}
}

