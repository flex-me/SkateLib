package org.domain
{
	import flash.utils.ByteArray;

	import mx.collections.ArrayCollection;

	import org.util.ObjectNumberMaker;

	public class BaseFont implements Element
	{
		public function BaseFont()
		{
		}
		//Refactor: should not use public fields. 
		private var _objectNumber:int = 0;

		public var fontName:String;
		public var shortFontName:String;

		public function get objectNumber():int{
			if(_objectNumber == 0){
				_objectNumber = ObjectNumberMaker.createNewObjectNumber();
			}
			return _objectNumber;
		}

		public function set objectNumber(value:int):void{
			_objectNumber = value;
		}

		public function toPdfObjects():ArrayCollection{
			return null;
		}

	}
}

