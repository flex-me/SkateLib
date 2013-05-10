package org.facade
{
	import app.share.EmbeddedImages;

	import flexunit.framework.Assert;

	import org.component.PNGImage;
	import org.component.StrokeColor;
	import org.domain.ImageXObject;
	import org.domain.PaperSize;
	import org.domain.RgbColor;

	public class TestControlCenter
	{

		[Test]
		public function testAddHRule():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			var book:Book=new Book();
			controlCenter.manage(book);

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);

			var strokeWidth:Number=10;
			var hRule:HRule=new HRule();
			book.addHRule(hRule);

			expectedCurrentPositionY=expectedCurrentPositionY - controlCenter.paragraphInterval - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);

		}

		[Test]
		public function testSetPageTemplate():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			Assert.assertNotNull(controlCenter.getPageTemplate());
		}

		[Test]
		public function testAddImageWhenNotEnoughRoomInFirstPage():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			controlCenter.currentPositionY=80;
			Assert.assertEquals(80, controlCenter.currentPositionY);
			var book:Book=new Book();
			controlCenter.manage(book);

			var imageXObject:ImageXObject=new ImageXObject();
			imageXObject.image=new PNGImage(new EmbeddedImages.Header());
			imageXObject.shortXObjectName="imageXObject";
			book.addScaleImage(new ScaleImage(imageXObject, 1));



			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - 52 - controlCenter.paragraphInterval - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
		}

		[Test]
		public function testAddImageThenACarriageReturnTriggerNewPage():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			controlCenter.currentPositionY=100;
			Assert.assertEquals(100, controlCenter.currentPositionY);
			var book:Book=new Book();
			controlCenter.manage(book);

			var imageXObject:ImageXObject=new ImageXObject();
			imageXObject.image=new PNGImage(new EmbeddedImages.Header());
			imageXObject.shortXObjectName="imageXObject";
			book.addScaleImage(new ScaleImage(imageXObject, 1));

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
		}

		[Test]
		public function testAddImageWithScale():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			var book:Book=new Book();
			controlCenter.manage(book);

			var imageXObject:ImageXObject=new ImageXObject();
			imageXObject.image=new PNGImage(new EmbeddedImages.Header());
			imageXObject.shortXObjectName="imageXObject";
			book.addScaleImage(new ScaleImage(imageXObject, 0.5));

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - 52 / 2 - controlCenter.paragraphInterval - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
		}


		[Test]
		public function testAddImage():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			var book:Book=new Book();
			controlCenter.manage(book);

			var imageXObject:ImageXObject=new ImageXObject();
			imageXObject.image=new PNGImage(new EmbeddedImages.Header());
			imageXObject.shortXObjectName="imageXObject";
			book.addScaleImage(new ScaleImage(imageXObject, 1));


			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - 52 - controlCenter.paragraphInterval - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
		}

		[Test]
		public function testAddCarriageReturn():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			Assert.assertEquals(1, controlCenter.document.pages.pageList.length);
			//for(var i:int = 0 ; i < 147 ; i++){
			for (var i:int=0; i < 49; i++)
			{
				controlCenter.addCarriageReturn();
			}
			Assert.assertEquals(2, controlCenter.document.pages.pageList.length);

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(781.89, controlCenter.currentPositionY);
		}

		//Refactor: this method is almost same as testAddCarriageReturn(). 
		[Test]
		public function testAddCarriageReturnInBook():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			var book:Book=new Book();
			controlCenter.manage(book);

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(781.89, controlCenter.currentPositionY);

			book.addCarriageReturn();
			expectedCurrentPositionY=expectedCurrentPositionY - controlCenter.paragraphInterval - controlCenter.textHeight;

			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(766.89, controlCenter.currentPositionY);

			Assert.assertEquals(1, controlCenter.document.pages.pageList.length);

			book.addCarriageReturn(48);

			expectedCurrentPositionY=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(2, controlCenter.document.pages.pageList.length);
		}

		[Test]
		public function testInitControlCenter():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			Assert.assertNotNull(controlCenter.document);

			Assert.assertEquals(ControlCenter.defaultPagePadding, controlCenter.paddingTop);
			Assert.assertEquals(ControlCenter.defaultPagePadding, controlCenter.paddingRight);
			Assert.assertEquals(ControlCenter.defaultPagePadding, controlCenter.paddingBottom);
			Assert.assertEquals(ControlCenter.defaultPagePadding, controlCenter.paddingLeft);

			Assert.assertEquals(ControlCenter.defaultTextHeight, controlCenter.textHeight);

			var expectedEditSpaceWidth:Number=PaperSize.A4.width - controlCenter.paddingLeft - controlCenter.paddingRight;
			Assert.assertEquals(expectedEditSpaceWidth, controlCenter.getEditSpaceWidth());

			Assert.assertEquals(controlCenter.paddingLeft, controlCenter.currentPositionX);

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;

			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(ControlCenter.defaultParagraphInterval, controlCenter.paragraphInterval);

			var expectedStrokeColor:StrokeColor=new StrokeColor(RgbColor.DarkGrey);
			Assert.assertTrue(expectedStrokeColor.equals(controlCenter.strokeColor));

			var book:Book=new Book();
			Assert.assertNull(book.controlCenter);
			controlCenter.manage(book);
			Assert.assertNotNull(book.controlCenter);
		}

		[Test]
		public function testAddParagraph():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			var book:Book=new Book();
			controlCenter.manage(book);

			var paragraph:Paragraph=new Paragraph();
			paragraph.text="Hello World! ";
			book.addParagraph(paragraph);

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			expectedCurrentPositionY=expectedCurrentPositionY - controlCenter.textHeight - controlCenter.paragraphInterval;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(766.89, controlCenter.currentPositionY);
			Assert.assertEquals(1, controlCenter.document.pages.pageList.length);

			for (var i:int=0; i < 48; i++)
			{
				book.addParagraph(paragraph);
			}

			expectedCurrentPositionY=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(2, controlCenter.document.pages.pageList.length);
		}

		[Test]
		public function testAddParagraphWithBiggerBottomPadding():void
		{
			var controlCenter:ControlCenter=new ControlCenter();
			controlCenter.paddingBottom+=5;
			var book:Book=new Book();
			controlCenter.manage(book);

			var paragraph:Paragraph=new Paragraph();
			paragraph.text="Hello World! ";

			for (var i:int=0; i < 49; i++)
			{
				book.addParagraph(paragraph);
			}

			var expectedCurrentPositionY:Number=PaperSize.A4.height - controlCenter.paddingTop - controlCenter.textHeight;
			Assert.assertEquals(expectedCurrentPositionY, controlCenter.currentPositionY);
			Assert.assertEquals(2, controlCenter.document.pages.pageList.length);
		}


	}
}

