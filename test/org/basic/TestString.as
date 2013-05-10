package org.basic
{
	import flexunit.framework.Assert;

	import org.main.Writer;

	public class TestString
	{
		[Test]
		public function testBasic():void{
			var charCode:int = 0x0A;
			var string:String = String.fromCharCode(charCode);
			Assert.assertEquals(Writer.endOfLine, string);
		}

		[Test]
		public function testReplace():void{
			var string:String = "abc)";
			Assert.assertEquals("abc\\)", string.replace(")", "\\)"));
		}

		[Test]
		public function testSplit():void{
			var string:String = "";
			var linesDividedByLineSeparator:Array = string.split("\n");
			Assert.assertEquals(1, linesDividedByLineSeparator.length);
		}

	}
}

