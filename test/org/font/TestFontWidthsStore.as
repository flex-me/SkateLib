package org.font
{
	import flexunit.framework.Assert;

	public class TestFontWidthsStore
	{
		[Test]
		public function testGetUnknownFontWidths():void{
			var widths:Object = FontWidthsStore.getWidthsByFontName(StandardFonts.timesRoman);
			Assert.assertNull(widths);
		}

		[Test]
		public function testGetHelveticaWidths():void{
			var widths:Object = FontWidthsStore.getWidthsByFontName(StandardFonts.helvetica);
			Assert.assertNotNull(widths);
			Assert.assertEquals(556, widths["a"]);
			Assert.assertEquals(556, widths["b"]);
			Assert.assertEquals(500, widths["c"]);
		}

		[Test]
		public function testGetHelveticaBoldWidths():void{
			var widths:Object = FontWidthsStore.getWidthsByFontName(StandardFonts.helveticaBold);
			Assert.assertNotNull(widths);
			Assert.assertEquals(556, widths["a"]);
			Assert.assertEquals(610, widths["b"]);
			Assert.assertEquals(556, widths["c"]);
		}
	}
}

