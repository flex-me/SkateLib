package org.component
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestRectangle
	{
		[Test]
		public function testToStreamValue():void{
			var rectangle:Rectangle = new Rectangle(10, 20, 30, 40);
			var expectedStreamValue:String = "10 20 30 40 re" + Writer.endOfLine;
			expectedStreamValue += "B" + Writer.endOfLine;
			Assert.assertEquals(expectedStreamValue, rectangle.toStreamValue());
		}

		[Test]
		public function testGetOperatorByCondition():void{
			Assert.assertEquals("B", Rectangle.getOperatorByCondition(true, true));
			Assert.assertEquals("f", Rectangle.getOperatorByCondition(true, false));
			Assert.assertEquals("S", Rectangle.getOperatorByCondition(false, true));
			Assert.assertEquals("n", Rectangle.getOperatorByCondition(false, false));
		}

	}
}

