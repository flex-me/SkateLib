package org.component
{
	import flexunit.framework.Assert;

	public class TestPolygon
	{
		[Test]
		public function testAddPoint():void{
			var polygon:Polygon = new Polygon();
			Assert.assertEquals(0, polygon.points.length);
			polygon.addPoint(new org.component.Point(100, 700));
			polygon.addPoint(new org.component.Point(200, 800));
			polygon.addPoint(new org.component.Point(300, 700));
			polygon.addPoint(new org.component.Point(200, 600));
			Assert.assertEquals(4, polygon.points.length);
			Assert.assertEquals(200, (polygon.points[3] as Point).x);
			Assert.assertEquals(600, (polygon.points[3] as Point).y);
		}

	}
}

