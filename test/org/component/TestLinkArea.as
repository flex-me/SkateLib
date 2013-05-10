package org.component
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestLinkArea
	{
		[Test]
		public function testToStreamValue():void{

			var rectangle:org.component.Rectangle = new org.component.Rectangle(100, 200, 200, 400);
			var linkArea:LinkArea = new LinkArea(rectangle, "http://www.google.com");
			var streamValue:String = linkArea.toStreamValue();

			var expectedStreamValue:String = "";
			expectedStreamValue += "<</Type /Annot" + Writer.endOfLine;
			expectedStreamValue += "/Subtype /Link" + Writer.endOfLine;
			expectedStreamValue += "/Rect [100 200 300 600]" + Writer.endOfLine;
			expectedStreamValue += "/Border [0 0 0]" + Writer.endOfLine;
			expectedStreamValue += "/H /I" + Writer.endOfLine;
			expectedStreamValue += "/A <<" + Writer.endOfLine;
			expectedStreamValue += "/S /URI" + Writer.endOfLine;
			expectedStreamValue += "/URI (http://www.google.com)" + Writer.endOfLine;
			expectedStreamValue += ">>" + Writer.endOfLine;
			expectedStreamValue += ">>" + Writer.endOfLine;

			Assert.assertEquals(expectedStreamValue, streamValue
				);
		}

	}
}

