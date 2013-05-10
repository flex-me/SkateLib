package org.util
{
	public class ObjectNumberMaker
	{
		private static var currentObjectNumber:int = 0;

		public static function createNewObjectNumber():int{
			currentObjectNumber++;
			return currentObjectNumber;
		}

		public static function reset():void{
			currentObjectNumber = 0;
		}

		public static function getCurrentObjectNumber():int{
			return currentObjectNumber;
		}

	}
}

