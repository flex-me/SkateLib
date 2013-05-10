package org.facade
{
	import org.component.Point;
	import org.component.Segment;
	import org.component.StrokeWidth;

	public class HRule
	{
		public var strokeWidth:StrokeWidth = new StrokeWidth(10);

		public var controlCenter:ControlCenter;

		public function HRule()
		{

		}

		public function draw():void{
			controlCenter.document.setStrokeColor(controlCenter.strokeColor);
			controlCenter.document.setStrokeWidth(strokeWidth);
			var startPoint:Point = new Point(controlCenter.currentPositionX, controlCenter.currentPositionY);
			var endPoint:Point = new Point(controlCenter.currentPositionX + controlCenter.getEditSpaceWidth(), controlCenter.currentPositionY);
			var segment:Segment = new Segment(startPoint, endPoint);
			controlCenter.document.addSegment(segment);
			controlCenter.updateCurrentPositionYAndNewPage(controlCenter.currentPositionY - controlCenter.paragraphInterval - controlCenter.textHeight);
		}

	}
}

