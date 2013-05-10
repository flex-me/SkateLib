package org.basic
{
	import flexunit.framework.Assert;

	public class TestNumber
	{
		[Test]
		public function testStringToNumber():void{
			var string:String = "15";
			Assert.assertEquals(15, Number(string));
		}

		[Test]
		public function testNaN():void{
			var a:Number;
			Assert.assertTrue(isNaN(a));
		}

		[Test]
		public function testDivideTwo():void{
			Assert.assertEquals(1, 3 % 2);
			Assert.assertEquals(1, 11 % 2);
			Assert.assertEquals(0, 12 % 2);
		}

	}
}

