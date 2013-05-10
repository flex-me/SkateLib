package org.util
{
	import flexunit.framework.Assert;

	import org.domain.Info;

	public class TestObjectNumberMaker
	{
		[Test]
		public function testCreateNewObjectNumber():void{
			Assert.assertEquals(1, ObjectNumberMaker.createNewObjectNumber());
			Assert.assertEquals(2, ObjectNumberMaker.createNewObjectNumber());
			ObjectNumberMaker.reset();
		}
	}
}

