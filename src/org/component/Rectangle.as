package org.component
{
	import org.main.Writer;
	import org.util.StringTool;

	public class Rectangle implements Component
	{
		public var x:Number;
		public var y:Number;
		public var width:Number;
		public var height:Number;

		public var needFilled:Boolean = true;
		public var needStroke:Boolean = true;

		public function Rectangle(x:Number, y:Number, width:Number, height:Number)
		{
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
		}

		public static function getOperatorByCondition(needFilled:Boolean, needStroke:Boolean):String{
			if(needFilled == true && needStroke == true)return "B";
			if(needFilled == true && needStroke == false)return "f";
			if(needFilled == false && needStroke == true)return "S";
			return "n";
		}

		public function toStreamValue():String{
			var streamValue:String = StringTool.setValue("{0} {1} {2} {3} re", [x, y, width, height]) + Writer.endOfLine;
			streamValue += getOperatorByCondition(needFilled, needStroke) + Writer.endOfLine;
			return streamValue;
		}
	}
}

