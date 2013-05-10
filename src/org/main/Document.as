package org.main
{
	import org.component.FilledColor;
	import org.component.FreeDrawingScript;
	import org.component.Image;
	import org.component.LinkArea;
	import org.component.Polygon;
	import org.component.Rectangle;
	import org.component.RectangleText;
	import org.component.Segment;
	import org.component.StrokeColor;
	import org.component.StrokeWidth;
	import org.component.Text;
	import org.component.WrapText;
	import org.domain.Catalog;
	import org.domain.Contents;
	import org.domain.Info;
	import org.domain.Page;
	import org.domain.Pages;
	import org.domain.Resources;
	import org.facility.Assistant;

	public class Document{

		public var pages:Pages;
		public var resources:Resources;
		public var info:Info;
		public var catalog:Catalog;

		public function Document(){
			pages = new Pages();
			resources = new Resources();
			info = new Info();
			catalog = new Catalog();
			catalog.pages = pages;
		}

		public function addPage():void{
			var page:Page = new Page();
			page.contents = new Contents();
			page.resources = resources;
			page.parent = pages;
			pages.addPage(page);
			if(catalog.startPage == null){
				catalog.startPage = page;
			}
		}

		public function addRectangle(rectangle:Rectangle):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addRectangle(rectangle);
		}

		public function addFreeDrawingScript(freeDrawingScript:FreeDrawingScript):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addFreeDrawingScript(freeDrawingScript);
		}

		public function addPolygon(polygon:Polygon):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addPolygon(polygon);
		}

		public function addSegment(segment:Segment):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;		
			contents.addSegment(segment);	
		}

		public function setStrokeColor(strokeColor:StrokeColor):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.setStrokeColor(strokeColor);			
		}

		public function setFilledColor(filledColor:FilledColor):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.setFilledColor(filledColor);
		}

		public function setStrokeWidth(strokeWidth:StrokeWidth):void{
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.setStrokeWidth(strokeWidth);
		}

		public function addRectangleText(rectangleText:RectangleText):void{
			resources.addBaseFont(rectangleText.getBaseFont());
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addRectangleText(rectangleText);
		}

		public function addText(text:Text):void{
			resources.addBaseFont(text.getBaseFont());
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addText(text);
		}

		public function addWrapText(wrapText:WrapText):void{
			resources.addBaseFont(wrapText.getBaseFont());
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addWrapText(wrapText);
		}

		public function addImage(image:Image):void{
			resources.addImageXObject(image.getImageXObject());
			var page:Page = pages.getCurrentPage();
			var contents:Contents = page.contents;
			contents.addImage(image);
		}

		public function addLinkArea(linkArea:LinkArea):void{
			var page:Page = pages.getCurrentPage();
			page.addLinkArea(linkArea);
		}
	}
}
















