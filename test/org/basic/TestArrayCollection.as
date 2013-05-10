package org.basic
{
	import flexunit.framework.Assert;

	import mx.collections.ArrayCollection;

	public class TestArrayCollection
	{
		[Test]
		public function testAddAll():void{
			var arrayCollection0:ArrayCollection = new ArrayCollection(["a", "b"]);
			var arrayCollection1:ArrayCollection = new ArrayCollection(["c", "d"]);
			var arrayCollection:ArrayCollection = new ArrayCollection();
			arrayCollection.addAll(arrayCollection0);
			Assert.assertEquals(2, arrayCollection.length);
			arrayCollection.addAll(arrayCollection1);
			Assert.assertEquals(4, arrayCollection.length);
			Assert.assertEquals("a", arrayCollection.getItemAt(0));
			Assert.assertEquals("b", arrayCollection.getItemAt(1));
			Assert.assertEquals("c", arrayCollection.getItemAt(2));
			Assert.assertEquals("d", arrayCollection.getItemAt(3));
		}

	}
}

