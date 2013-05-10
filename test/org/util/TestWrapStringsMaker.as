package org.util
{
	import flexunit.framework.Assert;

	import org.font.StandardFonts;
	import org.main.TestPdfObjectsCreator;

	public class TestWrapStringsMaker
	{
		[Test]
		public function testGetStringWidth():void{
			var aWidth:Number = WrapStringsMaker.getStringWidth("a", 24);
			var bWidth:Number = WrapStringsMaker.getStringWidth("b", 24);
			var cWidth:Number = WrapStringsMaker.getStringWidth("c", 24);
			Assert.assertEquals(aWidth + bWidth + cWidth, WrapStringsMaker.getStringWidth("abc", 24));
			Assert.assertEquals(38.688, WrapStringsMaker.getStringWidth("abc", 24));
			Assert.assertEquals(38.688 * 2, WrapStringsMaker.getStringWidth("abc", 24 * 2));
		}

		[Test]
		public function testGetCharactorWidth():void{
			Assert.assertEquals(6.672, WrapStringsMaker.getCharactorWidth("a", 12));
			Assert.assertEquals(6.672, WrapStringsMaker.getCharactorWidth("b", 12));
			Assert.assertEquals(2.664, WrapStringsMaker.getCharactorWidth("i", 12));
			var string:String = "ÀàÂâÇçÉéÈèÊêËëÎîÏïÔôÛûÙùÜüŸÿ";
			for(var i:int = 0 ; i < string.length ; i++){
				var charactor:String = string.charAt(i);
				var width:Number = WrapStringsMaker.getCharactorWidth(charactor, 12);
				Assert.assertTrue(width > 2);
			}
		}

		[Test]
		public function testWordsToLines():void{
			var words:Array = ["Hello ", "World ", "Hello ", "World ", "Hello ", "World ", "Hello ", "World "];
			var widthLimit:Number = 400;
			var lines:Array = WrapStringsMaker.wordsToLines(words, widthLimit, 24);
			var expectedStrings:Array = new Array();
			expectedStrings.push("Hello World Hello World Hello World ");
			expectedStrings.push("Hello World ");
			TestPdfObjectsCreator.equalsArray(expectedStrings, lines);
		}

		[Test]
		public function testWordsContainsBigWordToLines():void{
			var words:Array = ["Hello-World-Hello-World-Hello-World-Hello-World-"];
			var widthLimit:Number = 400;
			var lines:Array = WrapStringsMaker.wordsToLines(words, widthLimit, 24);
			var expectedStrings:Array = new Array();
			expectedStrings.push("Hello-World-Hello-World-Hello-World-Hello-World-");
			TestPdfObjectsCreator.equalsArray(expectedStrings, lines);
		}

		[Test]
		public function testSplitLongStringToWords():void{
			var longString:String = "As-a-company,-Google-focuses-on-three-key-are-as:-";
			var widthLimit:Number = 200;
			var fontSize:Number = 12;
			var words:Array = WrapStringsMaker.splitLongStringToWords(longString, widthLimit, fontSize, "");
			var expectedWords:Array = new Array();
			expectedWords.push("As-a-company,-Google-focuses-on-t");
			expectedWords.push("hree-key-are-as:-");
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testSplitLongStringToWordsMore():void{
			var longString:String = "As-a-company,-Google-focuses-on-three-key-are-as:-";
			var widthLimit:Number = 200;
			var fontSize:Number = 12;
			var words:Array = WrapStringsMaker.splitLongStringToWords(longString, widthLimit, fontSize, "-");
			var expectedWords:Array = new Array();
			expectedWords.push("As-a-company,-Google-focuses-on-t-");
			expectedWords.push("hree-key-are-as:-");
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testSplitLongStringToWordsWithShortString():void{
			var longString:String = "As-a-company,-Google";
			var widthLimit:Number = 200;
			var fontSize:Number = 12;
			var words:Array = WrapStringsMaker.splitLongStringToWords(longString, widthLimit, fontSize);
			var expectedWords:Array = new Array();
			expectedWords.push("As-a-company,-Google");
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testWordsContains2BigWordsToLines():void{
			var words:Array = ["Hello ", "Hello-World-Hello-World-Hello-World-Hello-World-"];
			var widthLimit:Number = 400;
			var lines:Array = WrapStringsMaker.wordsToLines(words, widthLimit, 24);
			var expectedStrings:Array = new Array();
			expectedStrings.push("Hello ");
			expectedStrings.push("Hello-World-Hello-World-Hello-World-Hello-World-");
			TestPdfObjectsCreator.equalsArray(expectedStrings, lines);
		}

		[Test]
		public function testIsLastIndex():void{
			Assert.assertTrue(WrapStringsMaker.isLastIndex(3, "abcd"));
		}

		[Test]
		public function testSplitToWordsFromBlankString():void{
			var words:Array = WrapStringsMaker.splitToWords("");
			var expectedWords:Array = new Array();
			expectedWords.push("");
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testSplitToWords():void{
			var string:String = "ab cd ";
			var words:Array = WrapStringsMaker.splitToWords(string);
			var expectedWords:Array = ["ab ", "cd "];
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testSplitToWordsMore():void{
			var string:String = "abc%%% eee,    sdfsdf ddd***";
			var words:Array = WrapStringsMaker.splitToWords(string);
			var expectedWords:Array = ["abc%%% ", "eee,    ", "sdfsdf ", "ddd***"];
			TestPdfObjectsCreator.equalsArray(expectedWords, words);
		}

		[Test]
		public function testFitInWidthLimit():void{
			var words:Array = ["abc%%% ", "eee,    ", "As-a-company,-Google-focuses-on-three-key-are-as:-", "sdfsdf ", "ddd***"];
			var widthLimit:Number = 200;
			var fontSize:Number = 12;
			var resultWords:Array = WrapStringsMaker.fitInWidthLimit(words, widthLimit, fontSize, "-");
			var expectedWords:Array = ["abc%%% ", "eee,    ", "As-a-company,-Google-focuses-on-t-", "hree-key-are-as:-", "sdfsdf ", "ddd***"];
			TestPdfObjectsCreator.equalsArray(expectedWords, resultWords);
		}

		[Test]
		public function testSeparateToStrings():void{
			var widthLimit:Number = 400;
			var string:String = "Hello World Hello World Hello World Hello World ";
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, widthLimit, 24);
			var strings:Array = wrapStringsMaker.separateToStrings();

			var expectedStrings:Array = new Array();
			expectedStrings.push("Hello World Hello World Hello World ");
			expectedStrings.push("Hello World ");

			TestPdfObjectsCreator.equalsArray(expectedStrings, strings);
		}

		[Test]
		public function testSeparateToStringsForEmptyString():void{
			var widthLimit:Number = 400;
			var string:String = "";
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, widthLimit, 24);
			var strings:Array = wrapStringsMaker.separateToStrings();

			var expectedStrings:Array = new Array();
			expectedStrings.push("");
			TestPdfObjectsCreator.equalsArray(expectedStrings, strings);
		}

		[Test]
		public function testSeparateToStringsForNullString():void{
			var widthLimit:Number = 400;
			var string:String = null;
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, widthLimit, 24);
			var strings:Array = wrapStringsMaker.separateToStrings();

			var expectedStrings:Array = new Array();
			expectedStrings.push("");
			TestPdfObjectsCreator.equalsArray(expectedStrings, strings);
		}

		[Test]
		public function testSeparateToStringsFromLongerString():void{
			var string:String = "As a company, Google focuses on three key are as: " + 
				"access anywhere, any time. Àà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß" + 
				"aaa bbb ccc";

			var wrapStringsMaker0:WrapStringsMaker = new WrapStringsMaker(string, 300, 12, StandardFonts.helveticaBold);
			var strings:Array = wrapStringsMaker0.separateToStrings();
			Assert.assertEquals(3, strings.length);
		}

		[Test]
		public function testSeparateToStringsSupportLineSeparationWord():void{
			var string:String = "As a company, Google focuses on three key are as: " + 
				"access anywhere, any time. Àà Ââ Çç É é È èÊê ËëÎî ÏïÔô ÛûÙùÜü Ÿÿ Ää Öö Üü ß" + 
				"aaa\nbbb\nccc";
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, 520 - 10 - 10 - 200, 12, StandardFonts.helveticaBold);
			var strings:Array = wrapStringsMaker.separateToStrings("\n");
			Assert.assertEquals(5, strings.length);
			Assert.assertEquals("ccc", strings[4]);
		}

		[Test]
		public function testSeparateToStringsFromBigWord():void{
			var string:String = "As-a-company,-Google-focuses-on-three-key-are-as:-";
			var textAreaWidth:Number = 200;
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, textAreaWidth, 12, StandardFonts.helvetica);
			var strings:Array = wrapStringsMaker.separateToStrings();
			var expectedStrings:Array = new Array();
			expectedStrings.push("As-a-company,-Google-focuses-on-t-");
			expectedStrings.push("hree-key-are-as:-");
			TestPdfObjectsCreator.equalsArray(expectedStrings, strings);
		}

		[Test]
		public function testSeparateToStringsFromBigWordMore():void{
			var string:String = "As-a-company,-Google-focuses-on-three-key-are-as:-%%%%%%%%%%%%%%%%%%%%%%%%";
			var textAreaWidth:Number = 200;
			var wrapStringsMaker:WrapStringsMaker = new WrapStringsMaker(string, textAreaWidth, 12, StandardFonts.helvetica);
			var strings:Array = wrapStringsMaker.separateToStrings();
			var expectedStrings:Array = new Array();
			expectedStrings.push("As-a-company,-Google-focuses-on-t-");
			expectedStrings.push("hree-key-are-as:-%%%%%%%%%-");
			expectedStrings.push("%%%%%%%%%%%%%%%");
			TestPdfObjectsCreator.equalsArray(expectedStrings, strings);
		}
	}
}

