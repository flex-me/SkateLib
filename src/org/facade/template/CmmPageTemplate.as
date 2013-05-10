package org.facade.template
{
	import flash.utils.ByteArray;

	import org.component.FilledColor;
	import org.component.Image;
	import org.component.PNGImage;
	import org.component.Text;
	import org.domain.ImageXObject;
	import org.domain.RgbColor;
	import org.facility.Assistant;
	import org.facility.ImageLocator;
	import org.font.StandardFonts;
	import org.main.Document;

	public class CmmPageTemplate implements PageTemplate
	{
		private var bannerFrontPage:ByteArray;
		private var footerFrontPage:ByteArray;
		private var header:ByteArray;
		private var footer:ByteArray;

		private static var defaultHeaderFooterPadding:Number = 20;

		public function CmmPageTemplate(bannerFrontPage:ByteArray, footerFrontPage:ByteArray, 
			header:ByteArray, footer:ByteArray)
		{
			this.bannerFrontPage = bannerFrontPage;
			this.footerFrontPage = footerFrontPage;
			this.header = header;
			this.footer = footer;
		}

		public function createBannerFrontPageImage(document:Document):Image{
			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(bannerFrontPage);
			imageXObject.shortXObjectName = "bannerFrontPage";
			return ImageLocator.toHeaderImage(imageXObject, document, defaultHeaderFooterPadding, defaultHeaderFooterPadding, defaultHeaderFooterPadding);
		}

		public function createFooterFrontPageImage(document:Document):Image{
			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(footerFrontPage);
			imageXObject.shortXObjectName = "footerFrontPage";
			return ImageLocator.toFooterImage(imageXObject, document, defaultHeaderFooterPadding, defaultHeaderFooterPadding, defaultHeaderFooterPadding);
		}

		public function createHeaderImage(document:Document):Image{
			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(header);
			imageXObject.shortXObjectName = "header";
			return ImageLocator.toHeaderImage(imageXObject, document, defaultHeaderFooterPadding, defaultHeaderFooterPadding, defaultHeaderFooterPadding);
		}

		public function createFooterImage(document:Document):Image{
			var imageXObject:ImageXObject = new ImageXObject();
			imageXObject.image = new PNGImage(footer);
			imageXObject.shortXObjectName = "footer";
			return ImageLocator.toFooterImage(imageXObject, document, defaultHeaderFooterPadding, 35, defaultHeaderFooterPadding);
		}		

		private function isBeginPage(document:Document):Boolean{
			return document.pages.pageList.length == 1;
		}

		public function decorate(document:Document):void{
//			Assistant.drawComplexGrid(document);

			if(isBeginPage(document)){
				var bannerFrontPageImage:Image = createBannerFrontPageImage(document);
				document.addImage(bannerFrontPageImage);
				var footerFrontPageImage:Image = createFooterFrontPageImage(document);
				document.addImage(footerFrontPageImage);

				document.setFilledColor(new FilledColor(RgbColor.White));
				//Refactor: should extract the date. 
				var bannerDateText:Text = new Text("15 November 2010", 40, 805, 12, StandardFonts.helveticaBold);
				document.addText(bannerDateText);
				document.setFilledColor(new FilledColor(RgbColor.Black));

			}else{
				var headerImage:Image = createHeaderImage(document);
				document.addImage(headerImage);
				var footerImage:Image = createFooterImage(document);
				document.addImage(footerImage);

				document.setFilledColor(new FilledColor(RgbColor.DarkGrey));
				var footerDateText:Text = new Text("15 November 2010", 20, 22, 8, StandardFonts.timesBold);
				document.addText(footerDateText);
				document.setFilledColor(new FilledColor(RgbColor.Black));

				var pageNumber:int = document.pages.pageList.length;
				var pageNumberText:Text = new Text("" + pageNumber, 550, 22, 8, StandardFonts.timesBold);
				document.addText(pageNumberText);

			}

			document.setFilledColor(new FilledColor(RgbColor.Black));
			var copyRightText:Text = new Text("© 2010 Moody’s Analytics, Inc. and/or its licensors and affiliates. All rights reserved.", 20, 42, 8, StandardFonts.timesRoman);
			document.addText(copyRightText);


		}
	}
}

