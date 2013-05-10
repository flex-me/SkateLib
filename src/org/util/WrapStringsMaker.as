package org.util
{
	import org.domain.BaseFont;
	import org.font.FontWidthsStore;

	public class WrapStringsMaker
	{
		private var string:String;
		private var widthLimit:Number;
		private var fontSize:Number;
		private var baseFont:BaseFont;
		private var tick:String;

		public function WrapStringsMaker(string:String,widthLimit:Number, fontSize:Number, baseFont:BaseFont=null, tick:String="-")
		{
			this.string = (string == null) ? "" : string;
			this.widthLimit = widthLimit;
			this.fontSize = fontSize;
			this.baseFont = baseFont;
			this.tick = tick;
		}

		public function separateToStrings(lineSeparator:String="\n"):Array{
			var paragraphs:Array = string.split(lineSeparator);
			var resultLines:Array = new Array();
			for each(var paragraph:String in paragraphs){
				var words:Array = splitToWords(paragraph);

				var wordsFitInWidthLimit:Array = fitInWidthLimit(words, widthLimit, fontSize, tick, baseFont);
				var lines:Array = wordsToLines(wordsFitInWidthLimit, widthLimit, fontSize, baseFont);

				resultLines = resultLines.concat(lines);
			}
			return resultLines;
		}

		public static function fitInWidthLimit(words:Array, widthLimit:Number, fontSize:Number, tick:String="-", baseFont:BaseFont=null):Array{
			var resultWords:Array = new Array();
			for each(var word:String in words){
				var fitInWidthLimitWords:Array = splitLongStringToWords(word, widthLimit, fontSize, tick, baseFont);
				for each(var fitInWidthLimitWord:String in fitInWidthLimitWords){
					resultWords.push(fitInWidthLimitWord);
				}
			}
			return resultWords;
		}

		public static function splitLongStringToWords(longString:String, widthLimit:Number, fontSize:Number, tick:String="-", baseFont:BaseFont=null):Array{
			var stringWidth:Number = getStringWidth(longString, fontSize, baseFont);
			if(stringWidth <= widthLimit){
				return [longString];
			}
			var words:Array = new Array();
			var tempWord:String = "";
			for(var i:int = 0 ; i < longString.length ; i++){
				var charactor:String = longString.charAt(i);
				var nextCharactor:String = null;
				if(i + 1 < longString.length){
					nextCharactor = longString.charAt(i + 1);
				}
				tempWord += charactor;
				if((getStringWidth(tempWord + tick, fontSize, baseFont) <= widthLimit) && (getStringWidth(tempWord + nextCharactor + tick, fontSize, baseFont) > widthLimit)){
					words.push(tempWord + tick);
					tempWord = "";
				}
			}
			words.push(tempWord);
			return words;
		}

		public static function isLastIndex(i:int, string:String):Boolean{
			return i == string.length - 1;
		}

		//Refactor: should add test. 
		public static function appendCharactorThenPushWord(word:String, i:int, string:String, words:Array):String{
			word += string.charAt(i);
			if(isLastIndex(i, string)){
				words.push(word);
			}
			return word;
		}

		//Refactor: should use regular formula. 
		public static function splitToWords(string:String):Array{
			if(string == ""){
				return [string];
			}
			var words:Array = new Array();
			var tempWord:String = "";
			var encounterSpaceCharactor:Boolean = false;
			for(var i:int = 0 ; i < string.length ; i++){
				var currentCharactor:String = string.charAt(i);
				if(currentCharactor != " " && encounterSpaceCharactor == false){
					tempWord = appendCharactorThenPushWord(tempWord, i, string, words);
				}
				if(currentCharactor != " " && encounterSpaceCharactor == true){
					words.push(tempWord);
					tempWord = "";
					encounterSpaceCharactor = false;
					i--;
				}
				if(currentCharactor == " "){
					encounterSpaceCharactor = true;
					tempWord = appendCharactorThenPushWord(tempWord, i, string, words);
				}
			}
			return words;
		}

		public static const DEFAULT_WIDTH:uint = 600;

		public static function getWidthsByBaseFont(baseFont:BaseFont=null):Object{
			return FontWidthsStore.getWidthsByFontName(baseFont);
		}

		public static function getCharactorWidth(charactor:String, fontSize:Number, baseFont:BaseFont=null):Number{
			var widths:Object = getWidthsByBaseFont(baseFont);

			var charactorWidth:Number = widths[charactor];
			if(isNaN(charactorWidth)){
				charactorWidth = DEFAULT_WIDTH;
			}
			return charactorWidth * fontSize / 1000;
		}

		//Refactor: should add test to it and other methods. 
		public static function getStringWidth(string:String, fontSize:Number, baseFont:BaseFont=null):Number{
			var stringWidthWidth:Number = 0;
			for(var i:int = 0 ; i < string.length ; i++){
				var charactor:String = string.charAt(i);
				var charactorCodeWidth:Number = getCharactorWidth(charactor, fontSize, baseFont);
				stringWidthWidth += charactorCodeWidth;
			}
			return stringWidthWidth;
		}

		public static function wordsToLines(words:Array, widthLimit:Number, fontSize:Number, baseFont:BaseFont=null):Array{
			var strings:Array = new Array();
			var buffer:String = "";
			for(var i:int = 0 ; i < words.length ; i++){
				var word:String = words[i];
				var newWordAddedWidth:Number = getStringWidth(buffer + word, fontSize, baseFont);
				if(newWordAddedWidth <= widthLimit){
					buffer += word;
					if(i == words.length - 1){
						strings.push(buffer);
					}
					continue;
				}
				if(newWordAddedWidth > widthLimit){
					var newWordWidth:Number = getStringWidth(word, fontSize, baseFont);
					if(newWordWidth <= widthLimit){
						strings.push(buffer);
						i--;
					}
					if(newWordWidth > widthLimit){
						if(buffer.length > 0){
							strings.push(buffer);
						}
						strings.push(word);
					}
					buffer = "";
				}
			}
			return strings;
		}

	}
}













