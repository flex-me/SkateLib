package org.facility
{
	import app.share.EmbeddedImages;

	import flexunit.framework.Assert;

	import org.component.Image;
	import org.component.PNGImage;
	import org.domain.ImageXObject;
	import org.main.Document;

	public class TestImageLocator
	{
		[Test]
		public function testToHeaderImage():void{
			var document:Document = new Document();
			document.addPage();

			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(new EmbeddedImages.BannerFrontPage());
			imageXObject.shortXObjectName = "bannerFrontPageImageXObject";

			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var paperHeight:Number = document.pages.getCurrentPage().paperSize.height;
			var imageWidth:Number = imageXObject.image.width;
			var imageHeight:Number = imageXObject.image.height;
			var scale:Number = paperWidth / imageWidth;
			var imageHeightAfterScale:Number = imageHeight * scale;
			var properPositionY:Number = paperHeight - imageHeightAfterScale;

			var expectedImage0:Image = new Image(imageXObject, 0, properPositionY, scale);
			var image0:Image = ImageLocator.toHeaderImage(imageXObject, document);
			Assert.assertTrue(expectedImage0.equals(image0));

			var expectedImage1:Image = new Image(imageXObject, 0, properPositionY - 10, scale);
			var image1:Image = ImageLocator.toHeaderImage(imageXObject, document, 10);
			Assert.assertTrue(expectedImage1.equals(image1));

			var expectedImage2:Image = new Image(imageXObject, paperWidth / 2, properPositionY + imageHeightAfterScale / 2, scale / 2);
			var image2:Image = ImageLocator.toHeaderImage(imageXObject, document, 0, 0, paperWidth / 2);
			Assert.assertTrue(expectedImage2.equals(image2));

			var expectedImage3:Image = new Image(imageXObject, 0, properPositionY + imageHeightAfterScale / 2, scale / 2);
			var image3:Image = ImageLocator.toHeaderImage(imageXObject, document, 0, paperWidth / 2, 0);
			Assert.assertTrue(expectedImage3.equals(image3));
		}

		[Test]
		public function testToFooterImage():void{
			var document:Document = new Document();
			document.addPage();

			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(new EmbeddedImages.FooterFrontPage());
			imageXObject.shortXObjectName = "footerFrontPageImageXObject";

			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var imageWidth:Number = imageXObject.image.width;
			var scale:Number = paperWidth / imageWidth;

			var expectedImage0:Image = new Image(imageXObject, 0, 0, scale);
			var image0:Image = ImageLocator.toFooterImage(imageXObject, document);
			Assert.assertTrue(expectedImage0.equals(image0));

			var expectedImage1:Image = new Image(imageXObject, 0, 0 + 20, scale);
			var image1:Image = ImageLocator.toFooterImage(imageXObject, document, 0, 20, 0);
			Assert.assertTrue(expectedImage1.equals(image1));

			var expectedImage2:Image = new Image(imageXObject, paperWidth / 2, 0, scale / 2);
			var image2:Image = ImageLocator.toFooterImage(imageXObject, document, 0, 0, paperWidth / 2);
			Assert.assertTrue(expectedImage2.equals(image2));

			var expectedImage3:Image = new Image(imageXObject, 0, 0, scale / 2);
			var image3:Image = ImageLocator.toFooterImage(imageXObject, document, paperWidth / 2, 0, 0);
			Assert.assertTrue(expectedImage3.equals(image3));
		}

	}
}

