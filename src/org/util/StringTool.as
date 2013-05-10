package org.util
{
	public class StringTool{

		//Refactor: add unit test. 
		public static function setValue(inputString:String, dataArray:Array):String{
			for(var i:int = 0 ; i < dataArray.length ; i++){
				var myPattern:RegExp = new RegExp("\\{" + i + "\\}","g");
				inputString = replacePattern(inputString, myPattern, dataArray[i]);
			}
			return inputString;
		}

		public static function replaceAll(content:String, oldPart:String, newPart:String):String{
			var pattern:RegExp = new RegExp(oldPart,"g");
			return replacePattern(content, pattern, newPart);
		}

		private static function replacePattern(content:String, pattern:RegExp, newPart:String):String{
			if(content == null)return null;
			return content.replace(pattern, newPart);
		}

		public static function useEscapeCharacter(content:String):String{
			return findAndReplace(')','\\)',findAndReplace('(','\\(',content));
		}

		public static function findAndReplace ( search:String, replace:String, source:String ):String{
			return source.split(search).join(replace);
		}

	}
}

