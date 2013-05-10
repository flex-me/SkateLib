package org.util
{
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	import flash.utils.ByteArray;
	import mx.controls.Alert;

	public class SaveMethod
	{
		public static function saveByteArrayToLocal(byteArray:ByteArray):void{
			var fileRef:FileReference = new FileReference();
			fileRef.save(byteArray,"Export" + new Date().time + ".pdf");
			fileRef.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}

		private static function onIOError(e:IOErrorEvent):void{
			if(e.type == IOErrorEvent.IO_ERROR){
				Alert.show("Please close any opened file which has same name with your exported file. ", "Error Message");
			}
		}

		public static function saveByteArrayToWeb(byteArray:ByteArray):void{
			var header:URLRequestHeader = new URLRequestHeader("Content-type","application/octet-stream");
			var myRequest:URLRequest = new URLRequest("http://localhost/ForExport/PdfExport.aspx"+'?name='+"Export" + new Date().getTime() + ".pdf"+'&method='+"attachment" );
			myRequest.requestHeaders.push (header);
			myRequest.method = URLRequestMethod.POST;
			myRequest.data = byteArray;
			navigateToURL(myRequest, "_blank");
		}
	}
}

