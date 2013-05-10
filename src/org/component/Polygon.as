package org.component
{
	import org.main.Writer;
	import org.util.StringTool;

	public class Polygon implements Component
	{
		public var points:Array = new Array();

		public function Polygon()
		{
		}

		public function addPoint(point:Point):void{
			points.push(point);
		}

		public function toStreamValue():String{

			var streamValue:String = "";
			for(var i:int = 0 ; i < points.length ; i++){
				var operator:String;
				if(i == 0){
					operator = "m";
				}else{
					operator = "l";
				}
				var x:Number = (points[i] as Point).x;
				var y:Number = (points[i] as Point).y;
				streamValue += StringTool.setValue("{0} {1} {2}", [x, y, operator]) + Writer.endOfLine;
			}
			streamValue += "h" + Writer.endOfLine;
			streamValue += "B" + Writer.endOfLine;
			return streamValue;
		}

	}
}

