package org.domain
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;

	import org.component.DoPNGImage;
	import org.component.PDFImage;
	import org.component.PNGImage;
	import org.main.PdfObject;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;
	import org.util.PNGEncoder;
	import org.util.StringTool;

	public class ImageXObject implements Element
	{
		//Refactor: should use better random name. 
		public var shortXObjectName:String = "" + Math.random();


		//Refactor: should rename to pdfImage. 
		public var image:PDFImage;
		private var _objectNumber:int = 0;

		public function get objectNumber():int{
			if(_objectNumber == 0){
				_objectNumber = ObjectNumberMaker.createNewObjectNumber();
			}
			return _objectNumber;
		}

		public function set objectNumber(value:int):void{
			_objectNumber = value;
		}

		public function ImageXObject()
		{
		}

		public function selfToPdfObject():PdfObject{
			var pdfObject:PdfObject = new PdfObject();
			pdfObject.objectNumber = objectNumber;
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

		public function toPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			var pdfObject:PdfObject = this.selfToPdfObject();
			pdfObjects.addItem(pdfObject);
			return pdfObjects;
		}

		public static function uiComponentToImageXObject(uiComponent:UIComponent):ImageXObject{
			var bitmapDataBuffer:BitmapData = new BitmapData(uiComponent.width, uiComponent.height, false);
			bitmapDataBuffer.draw(uiComponent);
			var bytes:ByteArray = PNGEncoder.encode(bitmapDataBuffer);
			var image:PNGImage = new DoPNGImage(bitmapDataBuffer, bytes);
			var flexImageXObject:ImageXObject = new ImageXObject();
			flexImageXObject.image = image;
			return flexImageXObject;
		}
	}
}

