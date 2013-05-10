package org.basic
{
	import flexunit.framework.Assert;

	public class TestChar
	{
		[Test]
		public function testCharInteger():void{
			var string:String = "abcÄŸ";
			Assert.assertEquals(97, string.charCodeAt(0));
			Assert.assertEquals(98, string.charCodeAt(1));
			Assert.assertEquals(99, string.charCodeAt(2));
			Assert.assertEquals(196, string.charCodeAt(3));
			Assert.assertEquals(376, string.charCodeAt(4));
		}

		[Test]
		public function testMakeStringFromCharCode():void{
			var string:String = String.fromCharCode(196);
			Assert.assertEquals("Ä", string);
		}

		//Refactor: should create a test Class: TestObject. 
		[Test]
		public function testUseObjectAsDictionary():void{
			var object:Object = new Object();
			object["a"] = "abc";
			object[""] = "blank";
		}
	}
}

