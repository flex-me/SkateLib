package org.component
{
	import flexunit.framework.Assert;

	import org.domain.RgbColor;
	import org.main.Writer;

	public class TestStrokeColor
	{
		[Test]
		public function testToStreamValue():void{
			var strokeColor:StrokeColor = new StrokeColor(RgbColor.White);
			Assert.assertEquals("1 1 1 RG" + Writer.endOfLine, strokeColor.toStreamValue());
		}
	}
}

