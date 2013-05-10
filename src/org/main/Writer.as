package org.main
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.main.Document;

	public class Writer
	{
		public static const endOfLine:String = "\n";
		public static const defaultCharSet:String = "windows-1252";
		public static const versionPart:String = "%PDF-1.5" + endOfLine;

		private var pdfObjects:ArrayCollection;
		private var trailer:Trailer;

		public static function generate(document:Document):ByteArray{
			var pdfObjectsCreator:PdfObjectsCreator = new PdfObjectsCreator(document);
			var pdfObjects:ArrayCollection = pdfObjectsCreator.createPdfObjects();
			var trailer:Trailer = pdfObjectsCreator.createTrailer();

			var writer:Writer = new Writer(pdfObjects, trailer);
			return writer.generateFromByteArrays();
		}

		public function Writer(pdfObjects:ArrayCollection, trailer:Trailer)
		{
			this.pdfObjects = pdfObjects;
			this.trailer = trailer;
		}

		public static function createObjectsPartFromByteArrays(pdfObjects:ArrayCollection):ByteArray{
			var objectsPartByteArray:ByteArray = new ByteArray();
			for each(var pdfObject:PdfObject in pdfObjects){
				var byteArray:ByteArray = pdfObject.toByteArray();
				objectsPartByteArray.writeBytes(byteArray);
			}
			return objectsPartByteArray;
		}

		public function generateFromByteArrays():ByteArray{
			var objectsPartByteArray:ByteArray = createObjectsPartFromByteArrays(pdfObjects);
			var crossReferencePart:String = createCrossReferencePart(pdfObjects, trailer);
			var crossReferencePartByteArray:ByteArray = new ByteArray();
			crossReferencePartByteArray.writeMultiByte(crossReferencePart, defaultCharSet);
			var versionPartByteArray:ByteArray = new ByteArray();
			versionPartByteArray.writeMultiByte(versionPart, defaultCharSet);

			var byteArray:ByteArray = new ByteArray();
			byteArray.writeBytes(versionPartByteArray);
			byteArray.writeBytes(objectsPartByteArray);
			byteArray.writeBytes(crossReferencePartByteArray);
			return byteArray;
		}		

		public static function createCrossReferencePart(pdfObjects:ArrayCollection, trailer:Trailer):String{
			var crossReferencePart:Array = new Array();
			var crossReferenceCountInfo:Array = createCrossReferenceCountInfo(pdfObjects);
			var crossReferenceEntries:Array = createCrossReferenceEntries(pdfObjects);
			var trailerEntries:Array = trailer.getTrailerEntries();
			crossReferencePart = crossReferencePart.concat(crossReferenceCountInfo);
			crossReferencePart = crossReferencePart.concat(crossReferenceEntries);
			crossReferencePart = crossReferencePart.concat(trailerEntries);
			return crossReferencePart.join(endOfLine) + Writer.endOfLine;
		}

		public static function createCrossReferenceCountInfo(pdfObjects:ArrayCollection):Array{
			var crossReferenceCountInfo:Array = new Array();
			crossReferenceCountInfo.push("xref");
			crossReferenceCountInfo.push("0 " + getPdfObjectsCount(pdfObjects));
			return crossReferenceCountInfo;
		}

		public static function createCrossReferenceEntries(pdfObjects:ArrayCollection):Array{
			var pdfObjectOffsets:Array = createPdfObjectOffsetsByAscendObjectNumber(pdfObjects);
			var crossReferenceEntries:Array = new Array();
			for each(var pdfObjectOffset:int in pdfObjectOffsets){
				var prefixedZerosOffset:String = prefixZerosTo(pdfObjectOffset);
				if(prefixedZerosOffset == "0000000000"){
					crossReferenceEntries.push(prefixedZerosOffset + " 65535 f ");
				}else{
					crossReferenceEntries.push(prefixedZerosOffset + " 00000 n ");
				}
			}
			return crossReferenceEntries;
		}

		public static function prefixZerosTo(pdfObjectOffset:int):String{
			var string:String = String(pdfObjectOffset);
			var prefixedZerosCount:int = 10 - string.length;
			var prefixedZeros:String = "";
			for(var i:int = 0 ; i < prefixedZerosCount ; i++){
				prefixedZeros += "0";
			}
			return prefixedZeros + string;
		}

		public static function createPdfObjectOffsetsByAscendObjectNumber(pdfObjects:ArrayCollection):Array{
			var pdfObjectOffsets:Array = new Array();
			pdfObjectOffsets.push(0);
			for(var i:int = 0 ; i < getPdfObjectsCount(pdfObjects) ; i++){
				var pdfObject:PdfObject = findPdfObjectByObjectNumber(pdfObjects, i);
				if(pdfObject != null){
					var pdfObjectOffset:int = getPdfObjectOffset(pdfObjects, pdfObject);
					pdfObjectOffsets.push(pdfObjectOffset);
				}
			}
			return pdfObjectOffsets;
		}

		public static function getPdfObjectOffset(pdfObjects:ArrayCollection, pdfObject:PdfObject):int{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeMultiByte(versionPart, defaultCharSet);
			for each(var tempPdfObject:PdfObject in pdfObjects){
				if(tempPdfObject.objectNumber == pdfObject.objectNumber){
					return byteArray.length;
				}
				byteArray.writeMultiByte(tempPdfObject.toString(), defaultCharSet);	
			}
			return 0;
		}

		public static function getPdfObjectsCount(pdfObjects:ArrayCollection):int{
			return pdfObjects.length + 1;
		}

		public static function findPdfObjectByObjectNumber(pdfObjects:ArrayCollection, objectNumber:int):PdfObject{
			for each(var pdfObject:PdfObject in pdfObjects){
				if(pdfObject.objectNumber == objectNumber){
					return pdfObject;
				}
			}
			return null;
		}
	}
}

