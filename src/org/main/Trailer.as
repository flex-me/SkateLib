package org.main
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.domain.Catalog;
	import org.domain.Info;
	import org.util.StringTool;

	public class Trailer
	{
		private var pdfObjects:ArrayCollection;

		public var catalog:Catalog;
		public var info:Info;

		public function Trailer(pdfObjects:ArrayCollection)
		{
			this.pdfObjects = pdfObjects;
		}

		public function getXrefOffset():int{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeMultiByte(Writer.versionPart, Writer.defaultCharSet);
			for each(var pdfObject:PdfObject in pdfObjects){
				byteArray.writeMultiByte(pdfObject.toString(), Writer.defaultCharSet);	
			}
			return byteArray.length;
		}

		public function getTrailerEntries():Array{
			var xrefOffset:int = getXrefOffset();
			var size:int = getPdfObjectsCount(pdfObjects);

			var trailerEntries:Array = new Array();
			trailerEntries.push("trailer");
			trailerEntries.push("<<");
			trailerEntries.push(StringTool.setValue("/Size {0}", [size]));
			trailerEntries.push(StringTool.setValue("/Root {0} 0 R", [catalog.objectNumber]));
			trailerEntries.push(StringTool.setValue("/Info {0} 0 R", [info.objectNumber]));
			trailerEntries.push(">>");
			trailerEntries.push("startxref");
			trailerEntries.push(xrefOffset);
			trailerEntries.push("%%EOF");
			return trailerEntries;
		}

		public static function getPdfObjectsCount(pdfObjects:ArrayCollection):int{
			return pdfObjects.length + 1;
		}

		public function equals(trailer:Trailer):Boolean{
			var currentTrailerEntries:Array = getTrailerEntries();
			var trailerEntries:Array = trailer.getTrailerEntries();
			if(currentTrailerEntries.length != trailerEntries.length){
				return false;
			}
			for(var i:int = 0 ; i < currentTrailerEntries.length ; i++){
				if(currentTrailerEntries[i] != trailerEntries[i]){
					return false;
				}	
			}
			return true;
		}
	}
}

