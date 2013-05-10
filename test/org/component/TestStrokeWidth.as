package org.component
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestStrokeWidth
	{
		[Test]
		public function testToStreamValue():void{
			var strokeWidth:StrokeWidth = new StrokeWidth(5);
			var streamValue:String = strokeWidth.toStreamValue();
			Assert.assertEquals("5 w" + Writer.endOfLine, streamValue);
		}

	}
}

