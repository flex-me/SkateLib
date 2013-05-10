package org.facade
{
	import org.facade.table.PdfTable;

	public class Book
	{
		public var controlCenter:ControlCenter;

		public function Book()
		{
		}

		public function setCurrentPositionX(currentPositionX:Number):void{
			controlCenter.currentPositionX = currentPositionX;
		}

		public function setCurrentPositionY(currentPositionY:Number):void{
			controlCenter.currentPositionY = currentPositionY;
		}

		public function drawTable(pdfTable:PdfTable):void{
			pdfTable.controlCenter = controlCenter;
			pdfTable.draw();
		}

		public function addHRule(hRule:HRule):void{
			hRule.controlCenter = controlCenter;
			hRule.draw();
		}

		public function addScaleImage(scaleImage:ScaleImage):void{
			scaleImage.controlCenter = controlCenter;
			scaleImage.draw();
		}

		public function addParagraph(paragraph:Paragraph):void{
			paragraph.controlCenter = controlCenter;
			paragraph.draw();
		}

		public function addCarriageReturn(lineCount:int=1):void{
			controlCenter.addCarriageReturn(lineCount);
		}

		public function newPage():void{
			controlCenter.newPage();
		}

	}
}

