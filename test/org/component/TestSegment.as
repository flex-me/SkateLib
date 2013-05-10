package org.component
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestSegment
	{
		[Test]
		public function testToStreamValue():void{
			var segment:Segment = new Segment(new Point(0, 1), new Point(2, 3));
			var expectedStreamValue:String = "0 1 m" + Writer.endOfLine;
			expectedStreamValue += "2 3 l" + Writer.endOfLine;
			expectedStreamValue += "S" + Writer.endOfLine;
			Assert.assertEquals(expectedStreamValue, segment.toStreamValue());
		}
	}
}

