package org.component
{
	import flexunit.framework.Assert;

	import org.domain.RgbColor;
	import org.main.Writer;

	public class TestFilledColor
	{
		[Test]
		public function testToStreamValue():void{
			var filledColor:FilledColor = new FilledColor(RgbColor.Black);
			Assert.assertEquals("0 0 0 rg" + Writer.endOfLine, filledColor.toStreamValue());
		}

	}
}

