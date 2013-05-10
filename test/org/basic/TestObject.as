package org.basic
{
	import flexunit.framework.Assert;

	public class TestObject
	{
		[Test]
		public function testGetNotExistField():void{
			var object:Object = {contentName:"abc"};
			Assert.assertEquals("abc", object.contentName);
			Assert.assertTrue(object.contentValue == null);
		}

	}
}

