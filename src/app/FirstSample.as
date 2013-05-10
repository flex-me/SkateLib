package app
{
	import app.share.EmbeddedImages;
	import mx.collections.ArrayCollection;
	import org.component.FilledColor;
	import org.component.Image;
	import org.component.LinkArea;
	import org.component.PNGImage;
	import org.component.RectangleText;
	import org.component.RectangleTextBorder;
	import org.component.RectangleTextContent;
	import org.component.WrapText;
	import org.component.WrapTextBorder;
	import org.component.WrapTextContent;
	import org.domain.BaseFont;
	import org.domain.ImageXObject;
	import org.domain.RgbColor;
	import org.font.StandardFonts;
	import org.main.Document;
	import org.util.WrapStringsMaker;

	public class FirstSample{

		public static function createDocument():Document{
			var firstSample:FirstSample = new FirstSample();
			return firstSample.create();
		}

		public function FirstSample()
		{
		}

		private function addBannerFrontPage(document:Document):void{
			var bannerFrontPageImageXObject:ImageXObject = new ImageXObject();
			bannerFrontPageImageXObject.image = new PNGImage(new EmbeddedImages.BannerFrontPage(), "DeviceRGB");
			bannerFrontPageImageXObject.shortXObjectName = "bannerFrontPageImageXObject";

			//Refactor: should use ImageLocator here. 
			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var paperHeight:Number = document.pages.getCurrentPage().paperSize.height;
			var imageWidth:Number = bannerFrontPageImageXObject.image.width;
			var imageHeight:Number = bannerFrontPageImageXObject.image.height;
			var scale:Number = paperWidth / imageWidth;
			var imageHeightAfterScale:Number = imageHeight * scale;
			var properPositionY:Number = paperHeight - imageHeightAfterScale;
			var image:Image = new Image(bannerFrontPageImageXObject, 0, properPositionY, scale);


			document.addImage(image);
		}

		private function addFooterFrontPage(document:Document):void{
			var footerFrontPageImageXObject:ImageXObject = new ImageXObject();
			footerFrontPageImageXObject.image = new PNGImage(new EmbeddedImages.FooterFrontPage());
			footerFrontPageImageXObject.shortXObjectName = "footerFrontPageImageXObject";


			//Refactor: should use ImageLocator here. 
			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var imageWidth:Number = footerFrontPageImageXObject.image.width;
			var scale:Number = paperWidth / imageWidth;
			var image:Image = new Image(footerFrontPageImageXObject, 0, 0, scale);

			document.addImage(image);
		}

		private function addTitle(document:Document):void{
			document.setFilledColor(new FilledColor(RgbColor.Black));
			var string:String = "RiskCalc 3.1 Peer Benchmark Report";
			var fontSize:int = 24;
			var baseFont:BaseFont = StandardFonts.helveticaBold;
			var stringWidth:Number = WrapStringsMaker.getStringWidth(string, fontSize, baseFont);
			var paperWidth:Number = document.pages.getCurrentPage().paperSize.width;
			var properPostionX:Number = (paperWidth - stringWidth) / 2;
			var text:org.component.Text = new org.component.Text(string, properPostionX, 650, fontSize, baseFont);
			document.addText(text);
		}

		private function addDescriptionWrapText(document:Document):void{
			var string:String = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ";
			var fontSize:int = 10;
			var rectangleWidth:Number = 500;
			var rectangleHeight:Number = 15;
			var positionX:Number = 50;
			var positionY:Number = 620;

			var wrapText:WrapText = new WrapText();
			wrapText.wrapTextContent = new WrapTextContent(string, fontSize, rectangleWidth, rectangleHeight, positionX, positionY, 
				StandardFonts.helvetica, RgbColor.hexStringToRGBColor("#275388"));

			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, rectangleWidth, fontSize, StandardFonts.helvetica);
			var strings:Array = wrapStringsMaker.separateToStrings();		
			wrapText.wrapTextBorder = new WrapTextBorder(rectangleWidth, rectangleHeight, positionX, positionY, 
				RgbColor.White, RgbColor.hexStringToRGBColor("#E3EBF4"), strings.length);

			document.addWrapText(wrapText);

			var linkArea:LinkArea = new LinkArea(wrapText.wrapTextBorder.getBorderRectangle(), "http://www.baidu.com");
			document.addLinkArea(linkArea);
		}

		private function addBenchmarkSummaryTitle(document:Document):void{
			document.setFilledColor(new FilledColor(RgbColor.Black));
			var text:org.component.Text = new org.component.Text("Benchmark Summary", 50, 550, 16, StandardFonts.courier);
			document.addText(text);				
		}

		private function addNamesColumn(document:Document):void{
			var names:Array = ["RiskCalc Model: ", "Firm Descriptor: ", "Peer Benchmark Industry Type: ", "Peer Benchmark Group: ", "Peer Benchmark Size Type: ", "Statements in Peer Benchmark: ", "Last Data Update: "];
			for(var i:int = 0 ; i < names.length ; i++){
				var rectangleHeight:Number = 20;
				var rectangle:org.component.Rectangle = new org.component.Rectangle(50, 520 - i * rectangleHeight, 200, rectangleHeight);
//				var rectangleText:RectangleText = new RectangleText(rectangle, names[i], 10, RgbColor.hexStringToRGBColor("#E3EBF4"), RgbColor.Black, RgbColor.hexStringToRGBColor("#E3EBF4"), StandardFonts.helveticaOblique);

				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.hexStringToRGBColor("#E3EBF4"), RgbColor.hexStringToRGBColor("#E3EBF4"));
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(names[i], 10, StandardFonts.helveticaOblique, RgbColor.Black, rectangle);
				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);

				document.addRectangleText(rectangleText);
			}
		}

		private function addValuesColumn(document:Document):void{
			var names:Array = ["RiskCalc Model: ", "Firm Descriptor: ", "Peer Benchmark Industry Type: ", "Peer Benchmark Group: ", "Peer Benchmark Size Type: ", "Statements in Peer Benchmark: ", "Last Data Update: "];
			for(var i:int = 0 ; i < names.length ; i++){
				var rectangleHeight:Number = 20;
				var rectangle:org.component.Rectangle = new org.component.Rectangle(250, 520 - i * rectangleHeight, 200, rectangleHeight);
//				var rectangleText:RectangleText = new RectangleText(rectangle, names[i], 10, RgbColor.hexStringToRGBColor("#E3EBF4"), RgbColor.hexStringToRGBColor("#1F497D"), RgbColor.hexStringToRGBColor("#E3EBF4"), StandardFonts.helvetica);


				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.hexStringToRGBColor("#E3EBF4"), RgbColor.hexStringToRGBColor("#E3EBF4"));
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(names[i], 10, StandardFonts.helvetica, RgbColor.hexStringToRGBColor("#1F497D"), rectangle);
				var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);

				document.addRectangleText(rectangleText);
			}
		}

		private function addInputSummaryTitle(document:Document):void{
			document.setFilledColor(new FilledColor(RgbColor.Black));
			var text:org.component.Text = new org.component.Text("Input Summary", 50, 350, 16, StandardFonts.courier);
			document.addText(text);				
		}

		private function addTableTitleRow(document:Document):void{
			var titles:Array = ["Statement Date", "2001-3-1", "2002-3-1"];
			var columnWidths:Array = [80, 50, 50];
			var positionX:Number = 50;
			for(var i:int = 0 ; i < titles.length ; i++){
				var rectangle:org.component.Rectangle = new org.component.Rectangle(positionX, 320, columnWidths[i], 20);
				positionX += columnWidths[i];
//				var rectangleText:RectangleText = new RectangleText(rectangle, titles[i], 8, RgbColor.hexStringToRGBColor("#BFBFBF"), RgbColor.Black, RgbColor.hexStringToRGBColor("#BFBFBF"), StandardFonts.helveticaBold);

				var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, RgbColor.hexStringToRGBColor("#BFBFBF"), RgbColor.hexStringToRGBColor("#BFBFBF"));
				var rectangleTextContent:RectangleTextContent = new RectangleTextContent(titles[i], 8, StandardFonts.helveticaBold, RgbColor.Black, rectangle);
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
				var positionX:Number = 50;
				var columnWidths:Array = [80, 50, 50];
				for(var j:int = 0 ; j < row.length ; j++){
					var rectangle:org.component.Rectangle = new org.component.Rectangle(positionX, 300 - i * 20, columnWidths[j], 20);
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

//					var rectangleText:RectangleText = new RectangleText(rectangle, row[j], 8, cellColor, RgbColor.Black, cellColor, baseFont);
					var rectangleTextBorder:RectangleTextBorder = new RectangleTextBorder(rectangle, cellColor, cellColor);
					var rectangleTextContent:RectangleTextContent = new RectangleTextContent(row[j], 8, baseFont, RgbColor.Black, rectangle);
					var rectangleText:RectangleText = new RectangleText(rectangleTextBorder, rectangleTextContent);

					document.addRectangleText(rectangleText);
				}
			}
		}

		private function addChart(document:Document):void{
			var chartImageXObject:ImageXObject = new ImageXObject();
			chartImageXObject.image = new PNGImage(new EmbeddedImages.Chart(), "DeviceRGB");
			chartImageXObject.shortXObjectName = "chartImageXObject";

			var imageWidth:Number = chartImageXObject.image.width;
			var imageHeight:Number = chartImageXObject.image.height;
			var scale:Number = 300 / imageWidth;
			var imageHeightAfterScale:Number = imageHeight * scale;
			var properPositionY:Number = 340 - imageHeightAfterScale;
			document.addImage(new Image(chartImageXObject, 250, properPositionY, scale));
		}

		private function addSummaryWrapText(document:Document):void{
			var string:String = "Weiß-goldenes Gewand, lange blonde Locken und goldene Krone: Das Nürnberger Christkind ist seit sechs Jahrzehnten die Symbolfigur des traditionsreichen Christkindlesmarkt von Nürnberg. Mit dem Beginn der Adventszeit eröffnet das Nürnberger Christkind am Freitag (27.11.) mit dem feierlichen Prolog von der Empore der Frauenkirche Deutschlands berühmtesten Weihnachtsmarkt.";
			var fontSize:int = 10;
			var rectangleWidth:Number = 500;
			var rectangleHeight:Number = 15;
			var positionX:Number = 50;
			var positionY:Number = 120;

			var wrapText:WrapText = new WrapText();	
			wrapText.wrapTextContent = new WrapTextContent(string, fontSize, rectangleWidth, rectangleHeight, positionX, positionY, 
				StandardFonts.helvetica, RgbColor.hexStringToRGBColor("#275388"));

			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, rectangleWidth, fontSize, StandardFonts.helvetica);
			var strings:Array = wrapStringsMaker.separateToStrings();		
			wrapText.wrapTextBorder = new WrapTextBorder(rectangleWidth, rectangleHeight, positionX, positionY, 
				RgbColor.White, RgbColor.White, strings.length);

			document.addWrapText(wrapText);
		}

		private function create():Document{
			var document:Document = new Document();
			document.addPage();
			addBannerFrontPage(document);
			addFooterFrontPage(document);
			addTitle(document);
			addDescriptionWrapText(document);
			addBenchmarkSummaryTitle(document);
			addNamesColumn(document);
			addValuesColumn(document);
			addInputSummaryTitle(document);
			addTableTitleRow(document);
			addTableContentRows(document);
			addChart(document);
			addSummaryWrapText(document);
			return document;
		}
	}
}

