package org.main
{
	import app.share.EmbeddedImages;

	import flash.utils.ByteArray;

	import flexunit.framework.Assert;

	import org.component.Image;
	import org.component.PNGImage;
	import org.domain.ImageXObject;
	import org.domain.Page;
	import org.domain.PaperSize;

	public class TestDocument{

		[Test]
		public function testPaperSize():void{
			var document:Document = new Document();
			document.addPage();
			var page:Page = document.pages.getCurrentPage();
			var paperSize:PaperSize = page.paperSize;
			Assert.assertEquals(PaperSize.A4.width, paperSize.width);
			Assert.assertEquals(PaperSize.A4.height, paperSize.height);
		}

		[Test]
		public function testAddImageXObject():void{
			var document:Document = new Document();
			document.addPage();

			Assert.assertEquals(0, document.resources.imageXObjects.length);
			Assert.assertEquals(0, (document.pages.pageList[0] as Page).contents.components.length);

			var bannerFrontPage:ByteArray = new EmbeddedImages.BannerFrontPage();
			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(bannerFrontPage);
			imageXObject.shortXObjectName = "bannerFrontPage";
			var positionX:Number = 100;
			var positionY:Number = 100;
			var scale:Number = 1;
			var image:Image = new Image(imageXObject, positionX, positionY, scale);
			document.addImage(image);

			Assert.assertEquals(1, document.resources.imageXObjects.length);
			Assert.assertEquals(1, (document.pages.pageList[0] as Page).contents.components.length);

		}
	}
}











