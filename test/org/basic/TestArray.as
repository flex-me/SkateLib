package org.basic
{
	import flexunit.framework.Assert;

	public class TestArray
	{
		[Test]
		public function testAppendArray():void{
			var array0:Array = [1, 2, 3];
			var array1:Array = [4, 5];
			var array2:Array = array0.concat(array1);
			Assert.assertEquals(3, array0.length);
			Assert.assertEquals(5, array2.length);
		}

		[Test]
		public function testJoin():void{
			var objectreferencesArray:Array = ["3 0 R", "4 0 R"];
			var objectReferencesString:String = objectreferencesArray.join(" ");
			Assert.assertEquals("3 0 R 4 0 R", objectReferencesString);
		}

		[Test]
		public function testIndexOf():void{
			var array:Array = ["a", "b", "c", "a"];
			Assert.assertEquals(0, array.indexOf("a"));
		}
	}
}

