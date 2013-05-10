package org.facade
{
	import org.component.Rectangle;
	import org.component.RectangleText;
	import org.component.RectangleTextBorder;
	import org.component.RectangleTextContent;
	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.util.StringTool;
	import org.util.WrapStringsMaker;

	//Refactor: should extract the same interface with PdfTable. 
	public class Paragraph
	{
		public var text:String;
		public var fontSize:Number;
		public var textFilledColor:RgbColor;
		public var baseFont:BaseFont;
		private var tick:String;

		public var controlCenter:ControlCenter;

		public function Paragraph(text:String="", fontSize:Number=12, textFilledColor:RgbColor=null, baseFont:BaseFont=null, tick:String="-")
		{
			this.text = text;
			this.fontSize = fontSize;
			this.textFilledColor = (textFilledColor == null) ? RgbColor.Black : textFilledColor;
			this.baseFont = (baseFont == null) ? StandardFonts.helvetica : baseFont;
			this.tick = tick;
		}

		public function draw():void{
			var cellRectangleWidth:Number = controlCenter.getEditSpaceWidth();
			var cellRectangleHeight:Number = controlCenter.textHeight;
			var positionX:Number = controlCenter.currentPositionX;
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(text, cellRectangleWidth, fontSize, baseFont, tick);
			var strings:Array = wrapStringsMaker.separateToStrings();

			for(var i:int = 0 ; i < strings.length ; i++){
				var rectangle:Rectangle = new Rectangle(positionX, controlCenter.currentPositionY, cellRectangleWidth, cellRectangleHeight);
				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.Yellow, RgbColor.Black, false);

				var string:String = strings[i];
				string = StringTool.useEscapeCharacter(string);

				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(string, fontSize, baseFont, textFilledColor, rectangle);
				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
				controlCenter.document.addRectangleText(rectangleText);
				if(i < strings.length - 1){
					controlCenter.updateCurrentPositionYAndNewPage(controlCenter.currentPositionY - cellRectangleHeight);
				}
			}
			controlCenter.addCarriageReturn();
		}

//		public static function useEscapeCharacter(content:String):String{
//			return findAndReplace(')','\\)',findAndReplace('(','\\(',content));
//		}
//
//		public static function findAndReplace ( search:String, replace:String, source:String ):String{
//			return source.split(search).join(replace);
//		}

	}
}

