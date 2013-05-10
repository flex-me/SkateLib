package org.main
{
	import flash.utils.ByteArray;

	public class PdfObject{

		public var objectNumber:int;
		public var string:String;
		public var byteArray:ByteArray;

		public function PdfObject()
		{
		}

		public function toString():String{
			return string;
		}

		public function toByteArray():ByteArray{
			return byteArray;
		}

		public function equals(pdfObject:PdfObject):Boolean{
			if(objectNumber != pdfObject.objectNumber){
				return false;
			}
			if(string != pdfObject.string){
				return false;
			}
			if(byteArray.length != pdfObject.byteArray.length){
				return false;
			}
			for(var i:int = 0 ; i < byteArray.length ; i++){
				if(byteArray[i] != pdfObject.byteArray[i]){
					return false;
				}
			}
			return true;
		}
	}
}

