package org.util
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestStringTool{

		[Test]
		public function testReplaceAll():void{
			Assert.assertEquals("abc", StringTool.replaceAll("a%bc", "%", ""));
			Assert.assertEquals("a\nbc", StringTool.replaceAll("a\r\nbc", "\r\n", Writer.endOfLine));
		}

		[Test]
		public function testEscape():void{
			Assert.assertEquals("(abc", "\(abc");
		}

		[Test]
		public function testLength():void{
			var string:String = Writer.endOfLine;
			Assert.assertEquals(1, string.length);
		}

		[Test]
		public function testUseEscapeCharacter():void{
			var string:String = StringTool.useEscapeCharacter("(sadfasd");
			Assert.assertEquals("\\(sadfasd", string);
		}
	}
}

