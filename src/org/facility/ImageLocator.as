package org.facility
{
	import org.component.Image;
	import org.domain.ImageXObject;
	import org.main.Document;

	public class ImageLocator
	{
		public static function toHeaderImage(imageXObject:ImageXObject, document:Document, paddingTop:Number=0, paddingRight:Number=0, paddingLeft:Number=0):Image{
			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var targetWidth:Number = paperWidth - paddingLeft - paddingRight;
			var paperHeight:Number = document.pages.getCurrentPage().paperSize.height;
			var imageWidth:Number = imageXObject.image.width;
			var imageHeight:Number = imageXObject.image.height;
			var scale:Number = targetWidth / imageWidth;
			var imageHeightAfterScale:Number = imageHeight * scale;
			var properPositionY:Number = paperHeight - paddingTop - imageHeightAfterScale;
			var image:Image = new Image(imageXObject, 0 + paddingLeft, properPositionY, scale);
			return image;
		}

		public static function toFooterImage(imageXObject:ImageXObject, document:Document, paddingRight:Number=0, paddingBottom:Number=0, paddingLeft:Number=0):Image{
			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var targetWidth:Number = paperWidth - paddingLeft - paddingRight;
			var imageWidth:Number = imageXObject.image.width;
			var scale:Number = targetWidth / imageWidth;
			var image:Image = new Image(imageXObject, paddingLeft, paddingBottom, scale);
			return image;
		}
	}
}

