package org.domain
{
	import flexunit.framework.Assert;

	import org.font.FontFactory;
	import org.font.StandardFonts;
	import org.main.Writer;
	import org.util.ObjectNumberMaker;

	public class TestResources
	{
		[Test]
		public function testIsNewImageXObject():void{
			var resources:Resources = new Resources();
			var imageXObject0:ImageXObject = new ImageXObject();
			imageXObject0.shortXObjectName = "imageXObject0";
			var imageXObject1:ImageXObject = new ImageXObject();
			imageXObject1.shortXObjectName = "imageXObject1";
			var imageXObjects:Array = new Array();
			imageXObjects.push(imageXObject0);
			imageXObjects.push(imageXObject1);
			resources.imageXObjects = imageXObjects;
			Assert.assertFalse(resources.isNewImageXObject(imageXObject0));
		}

		[Test]
		public function testAddDuplicatedImageXObject():void{
			var resources:Resources = new Resources();
			var imageXObject0:ImageXObject = new ImageXObject();
			imageXObject0.shortXObjectName = "headerImage";
			resources.addImageXObject(imageXObject0);
			Assert.assertEquals(1, resources.imageXObjects.length);
			resources.addImageXObject(imageXObject0);
			Assert.assertEquals(1, resources.imageXObjects.length);
			var imageXObject1:ImageXObject = new ImageXObject();
			imageXObject1.shortXObjectName = "";
			resources.addImageXObject(imageXObject1);
			Assert.assertEquals(2, resources.imageXObjects.length);
			resources.addImageXObject(imageXObject1);
			Assert.assertEquals(2, resources.imageXObjects.length);
		}

		[Test]
		public function testGetFontValues():void{
			var resources:Resources = new Resources();
			resources.addBaseFont(StandardFonts.helvetica);
			var expectedFontValues0:String = "/" + StandardFonts.helvetica.shortFontName + " 1 0 R" + Writer.endOfLine;
			Assert.assertEquals(expectedFontValues0, resources.getFontValues());
			resources.addBaseFont(StandardFonts.timesRoman);
			var expectedFontValues1:String = "/" + StandardFonts.helvetica.shortFontName + " 1 0 R" + Writer.endOfLine
				+ "/" + StandardFonts.timesRoman.shortFontName + " 2 0 R" + Writer.endOfLine;
			Assert.assertEquals(expectedFontValues1, resources.getFontValues());
			Assert.assertEquals(2, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}

		[Test]
		public function testGetImageXObjectValues():void{
			var resources:Resources = new Resources();
			var imageXObject0:ImageXObject = new ImageXObject();
			imageXObject0.shortXObjectName = "imageXObject0";
			var imageXObject1:ImageXObject = new ImageXObject();
			imageXObject1.shortXObjectName = "imageXObject1";
			resources.addImageXObject(imageXObject0);
			resources.addImageXObject(imageXObject1);
			var expectedImageXObjectValues:String = "";
			expectedImageXObjectValues += "/imageXObject0 1 0 R" + Writer.endOfLine;
			expectedImageXObjectValues += "/imageXObject1 2 0 R" + Writer.endOfLine;
			Assert.assertEquals(expectedImageXObjectValues, resources.getImageXObjectValues());
			Assert.assertEquals(2, ObjectNumberMaker.getCurrentObjectNumber());
			ObjectNumberMaker.reset();
		}

		[Test]
		public function testAddFont():void{
			var resources:Resources = new Resources();
			resources.addBaseFont(StandardFonts.timesRoman);
			Assert.assertEquals(1, resources.baseFonts.length);
			Assert.assertEquals(StandardFonts.timesRoman.fontName, resources.baseFonts[0].fontName);
			Assert.assertEquals(StandardFonts.timesRoman.shortFontName, resources.baseFonts[0].shortFontName);
		}

		[Test]
		public function testAddDuplicateFont():void{
			var resources:Resources = new Resources();
			resources.addBaseFont(StandardFonts.timesRoman);
			Assert.assertEquals(1, resources.baseFonts.length);
			resources.addBaseFont(StandardFonts.helvetica);
			Assert.assertEquals(2, resources.baseFonts.length);
			resources.addBaseFont(StandardFonts.helvetica);
			Assert.assertEquals(2, resources.baseFonts.length);

			var baseFont:BaseFont = FontFactory.createEmbeddedFont();
			resources.addBaseFont(baseFont);
			Assert.assertEquals(3, resources.baseFonts.length);
			resources.addBaseFont(baseFont);
			Assert.assertEquals(3, resources.baseFonts.length);
		}

		[Test]
		public function testIsNewBaseFont():void{
			var baseFonts:Array = new Array();
			baseFonts.push(StandardFonts.helvetica);
			baseFonts.push(StandardFonts.timesRoman);
			var resources:Resources = new Resources();
			resources.baseFonts = baseFonts;
			Assert.assertFalse(resources.isNewBaseFont(StandardFonts.helvetica));
		}

		[Test]
		public function testAddNullFont():void{
			var resources:Resources = new Resources();
			resources.addBaseFont(null);
			Assert.assertEquals(0, resources.baseFonts.length);
		}
	}
}

