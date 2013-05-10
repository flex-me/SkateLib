package app
{
	import mx.collections.ArrayCollection;
	import org.component.Rectangle;
	import org.component.RectangleText;
	import org.component.RectangleTextBorder;
	import org.component.RectangleTextContent;
	import org.component.WrapText;
	import org.component.WrapTextBorder;
	import org.component.WrapTextContent;
	import org.domain.BaseFont;
	import org.domain.RgbColor;
	import org.facility.Assistant;
	import org.font.StandardFonts;
	import org.main.Document;
	import org.util.WrapStringsMaker;

	public class WordWrapTableTitles
	{
		public static function createDocument():Document{
			var wordWrapTableTitles:WordWrapTableTitles = new WordWrapTableTitles();
			return wordWrapTableTitles.create();
		}

		public function WordWrapTableTitles()
		{
		}

//Refactor: should integrate the method in WrapRow of CMM Project. 
		private function addSimpleTitleRow(document:Document):void{
			var titles:Array = ["Statement Date Statement Date ", "abc ddd ee dd dd dwerqwe dd", "234 345 345 234 234 23342432 23 more more more "];
			var columnWidths:Array = [160, 100, 100];
			var positionX:Number = 100;

			var maxRowCountOfWrapText:int = 0;
			for(var index:int = 0 ; index < titles.length ; index++){
				var tempWrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(titles[index], columnWidths[index], 8, StandardFonts.helveticaBold);
				var tempStrings:Array = tempWrapStringsMaker.separateToStrings();
				if(tempStrings.length > maxRowCountOfWrapText){
					maxRowCountOfWrapText = tempStrings.length;
				}
			}

			for(var i:int = 0 ; i < titles.length ; i++){
				var wrapText:WrapText = new WrapText();
				wrapText.wrapTextContent = new WrapTextContent(titles[i], 8, columnWidths[i], 20, positionX, 700, StandardFonts.helveticaBold, RgbColor.Black);
				wrapText.wrapTextContent.horizontalAlign = RectangleTextContent.CENTER;

				var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(titles[i], columnWidths[i], 8, StandardFonts.helveticaBold);
				var strings:Array = wrapStringsMaker.separateToStrings();
				wrapText.wrapTextBorder = new WrapTextBorder(columnWidths[i], 20, positionX, 700, RgbColor.Black, RgbColor.hexStringToRGBColor("#BFBFBF"), maxRowCountOfWrapText);

				document.addWrapText(wrapText);
				positionX += columnWidths[i];
			}

		}

		private function addTableTitleRow(document:Document):void{
			var titles:Array = ["Statement Date", "2001-3-1", "2002-3-1"];
			var columnWidths:Array = [160, 100, 100];
			var positionX:Number = 100;
			for(var i:int = 0 ; i < titles.length ; i++){
				var rectangle:Rectangle = new Rectangle(positionX, 640, columnWidths[i], 20);
				positionX += columnWidths[i];
				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.Yellow, RgbColor.Black);
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(titles[i], 8, StandardFonts.helveticaBold, RgbColor.Black, rectangle);
				rectangleTextContent.paddingLeft = 5;

				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
				document.addRectangleText(rectangleText);
			}
		}

		private function addTableContentRows(document:Document):void{
			var contents:ArrayCollection = new ArrayCollection();
			contents.addItem(["Cash & Securities", "12345", "55452"]);
			contents.addItem(["Inventory", "251", "9654"]);
			contents.addItem(["Cash & Securities", "12345", "55452"]);
			contents.addItem(["Inventory", "251", "9654"]);
			contents.addItem(["Cash & Securities", "12345", "55452"]);
			contents.addItem(["Inventory", "251", "9654"]);
			contents.addItem(["Cash & Securities", "12345", "55452"]);
			contents.addItem(["Inventory", "251", "9654"]);

			for(var i:int = 0 ; i < contents.length ; i++){
				var row:Array = contents.getItemAt(i) as Array;
				var positionX:Number = 100;
				var columnWidths:Array = [160, 100, 100];
				for(var j:int = 0 ; j < row.length ; j++){
					var rectangle:org.component.Rectangle = new org.component.Rectangle(positionX, 620 - i * 20, columnWidths[j], 20);
					positionX += columnWidths[j];
					var cellColor:RgbColor;
					if(i % 2 == 0){
						cellColor = RgbColor.White;
					}else{
						cellColor = RgbColor.hexStringToRGBColor("#D8D8D8");
					}
					var baseFont:BaseFont;
					if(j == 0){
						baseFont = StandardFonts.helveticaBold;
					}else{
						baseFont = StandardFonts.helvetica;
					}
					var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, cellColor, RgbColor.Black);
					var rectangleTextContent:RectangleTextContent = new RectangleTextContent(row[j], 8, baseFont, RgbColor.Black, rectangle);

					if(j == 0){
						rectangleTextContent.horizontalAlign = RectangleTextContent.LEFT;
						rectangleTextContent.paddingLeft = 5;
					}else{
						rectangleTextContent.horizontalAlign = RectangleTextContent.RIGHT;
						rectangleTextContent.paddingRight = 5;						
					}

					var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
					document.addRectangleText(rectangleText);
				}
			}
		}

		private function addExtensibleTableTitleRow(document:Document):void{
			var titles:Array = ["abc abcd eeed df eee ddsa erew ", "abc abcd ", "sdf 234 234234 234 234"];
			var minWidths:Array = [100, 100, 100];
			var startRectangleX:Number = 100;
			for(var i:int = 0 ; i < titles.length ; i++){
				var paddingLeft:Number = 10;
				var paddingRight:Number = 10;

				var fontSize:Number = 12;

				var title:String = titles[i];
				var currentWidth:Number = minWidths[i];

				var stringLength:Number = WrapStringsMaker.getStringWidth(titles[i], fontSize, StandardFonts.helvetica);

				if(stringLength > (currentWidth - paddingLeft - paddingRight)){
					currentWidth = stringLength + paddingLeft + paddingRight;
				}

				var rectangle:Rectangle = new Rectangle(startRectangleX, 300, currentWidth, 100);
				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.GrassGreen, RgbColor.Yellow, true);
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(titles[i], fontSize, StandardFonts.helvetica, RgbColor.Black, rectangle);
				rectangleTextContent.paddingLeft = paddingLeft;
				rectangleTextContent.paddingRight = paddingRight;
				rectangleTextContent.horizontalAlign = RectangleTextContent.RIGHT;

				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);
				document.addRectangleText(rectangleText);
				startRectangleX += currentWidth;
			}


		}

		private function create():Document{
			var document:Document = new Document();
			document.addPage();
			Assistant.makeGrid(document);
			addSimpleTitleRow(document);
			addTableTitleRow(document);
			addTableContentRows(document);
			addExtensibleTableTitleRow(document);
			return document;
		}

	}
}

