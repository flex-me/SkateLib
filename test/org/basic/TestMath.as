package org.basic
{
	import flexunit.framework.Assert;

	public class TestMath
	{
		[Test]
		public function testBasic():void{
			Assert.assertTrue(0 < Math.random());
			Assert.assertTrue(Math.random() < 1);
		}

		[Test]
		public function testOddEven():void{
			Assert.assertEquals(1, 3 % 2);
			Assert.assertEquals(0, 0 % 2);
		}
	}
}

