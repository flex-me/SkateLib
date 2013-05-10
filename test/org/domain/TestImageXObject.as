package org.domain
{
	import flexunit.framework.Assert;

	public class TestImageXObject
	{
		[Test]
		public function testRandomShortXObjectName():void{
			var imageXObject:ImageXObject = new ImageXObject();
			Assert.assertTrue(0 < Number(imageXObject.shortXObjectName));
			Assert.assertTrue(Number(imageXObject.shortXObjectName) < 1);
		}

	}
}

