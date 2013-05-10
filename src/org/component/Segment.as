package org.component
{

	import org.main.Writer;
	import org.util.StringTool;

	public class Segment implements Component
	{
		public var startPoint:Point;
		public var endPoint:Point;

		public function Segment(startPoint:Point, endPoint:Point)
		{
			this.startPoint = startPoint;
			this.endPoint = endPoint;
		}

		public function toStreamValue():String{
			var streamValue:String = StringTool.setValue("{0} {1} m", [startPoint.x, startPoint.y]) + Writer.endOfLine;
			streamValue += StringTool.setValue("{0} {1} l", [endPoint.x, endPoint.y]) + Writer.endOfLine;
			streamValue += "S" + Writer.endOfLine;
			return streamValue;	
		}

	}
}

