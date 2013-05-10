package org.facade
{
	import org.component.StrokeColor;
	import org.domain.RgbColor;
	import org.facade.template.DefaultPageTemplate;
	import org.facade.template.PageTemplate;
	import org.facility.Assistant;
	import org.main.Document;

	public class ControlCenter
	{
		public static var defaultPagePadding:Number = 50;
		public static var defaultTextHeight:Number = 10;
		public static var defaultParagraphInterval:Number = 5;
		public static var defaultStrokeColor:StrokeColor = new StrokeColor(RgbColor.DarkGrey);

		public var paddingTop:Number = defaultPagePadding;
		public var paddingRight:Number = defaultPagePadding;
		public var paddingBottom:Number = defaultPagePadding;
		public var paddingLeft:Number = defaultPagePadding;

		public var textHeight:Number = defaultTextHeight;

		public var currentPositionX:Number = paddingLeft;
		public var currentPositionY:Number;

		public var paragraphInterval:Number = defaultParagraphInterval;

		private var pageTemplate:PageTemplate;

		public var strokeColor:StrokeColor = defaultStrokeColor;

		public var document:Document;

		public function resetCurrentPositionX():void{
			currentPositionX = paddingLeft;
		}

		public function ControlCenter(pageTemplate:PageTemplate=null)
		{
			this.pageTemplate = (pageTemplate == null) ? new DefaultPageTemplate() : pageTemplate;
			document = new Document();
			newPage();
		}

		public function getPageTemplate():PageTemplate{
			return pageTemplate;
		}

		public function newPage():void{
			document.addPage();
			currentPositionX = paddingLeft;
			currentPositionY = document.pages.getCurrentPage().paperSize.height - paddingTop - textHeight;
			pageTemplate.decorate(document);
		}

		public function manage(book:Book):void{
			book.controlCenter = this;
		}

		public function getEditSpaceWidth():Number{
			return document.pages.getCurrentPage().paperSize.width - paddingLeft - paddingRight;
		}

		public function addCarriageReturn(lineCount:int=1):void{
			for(var i:int = 0 ; i < lineCount ; i++){
				updateCurrentPositionYAndNewPage(currentPositionY - paragraphInterval - this.textHeight);
			}
		}

		public function updateCurrentPositionYAndNewPage(newCurrentPositionY:Number):void{
			currentPositionY = newCurrentPositionY;
			checkAndNewPage(currentPositionY);
		}

		public function checkAndNewPage(computedCurrentPositionY:Number):void{
			if(computedCurrentPositionY  < paddingBottom){
				newPage();
			}
		}

	}
}

