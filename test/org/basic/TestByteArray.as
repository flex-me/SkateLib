package org.basic
{
	import flash.utils.ByteArray;

	import flexunit.framework.Assert;

	import org.main.TestPdfObjectsCreator;
	import org.main.Writer;

	public class TestByteArray
	{
		[Test]
		public function testCharSet():void{
			var string:String = "Â)";
			var byteArray0:ByteArray = new ByteArray();
			byteArray0.writeMultiByte(string, Writer.defaultCharSet);
			var byteArray1:ByteArray = new ByteArray();
			byteArray1.writeMultiByte(string, "windows-1252");
			TestPdfObjectsCreator.equalsByteArray(byteArray0, byteArray1);
		}

		[Test]
		public function testCombineByteArray():void{

			var byteArray0:ByteArray = new ByteArray();
			byteArray0.writeMultiByte("abc", Writer.defaultCharSet);

			var byteArray1:ByteArray = new ByteArray();
			byteArray1.writeMultiByte("ddd", Writer.defaultCharSet);

			var combinedByteArray:ByteArray = new ByteArray();
			combinedByteArray.writeBytes(byteArray0);
			Assert.assertEquals(3, combinedByteArray.length);
			combinedByteArray.writeBytes(byteArray1);
			Assert.assertEquals(6, combinedByteArray.length);
		}

		[Test]
		public function testAddString():void{
			var byteArray:ByteArray = new ByteArray();
			Assert.assertEquals(0, byteArray.length);
			byteArray.writeMultiByte("abc", Writer.defaultCharSet);
			Assert.assertEquals(3, byteArray.length);
			byteArray.writeMultiByte("def", Writer.defaultCharSet);
			Assert.assertEquals(6, byteArray.length);
		}

		[Test]
		public function testDeflate():void{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeMultiByte("Hello World Hello World Hello World Hello World Hello World Hello World", Writer.defaultCharSet);
			Assert.assertEquals(71, byteArray.length);
			byteArray.deflate();
			Assert.assertEquals(17, byteArray.length);
			byteArray.inflate();
			Assert.assertEquals(71, byteArray.length);
		}

		[Test]
		public function testCompress():void{
			var byteArray:ByteArray = new ByteArray();
			var basicString:String = "Hello World Hello World Hello World Hello World Hello World Hello World";

			byteArray.writeMultiByte(basicString, Writer.defaultCharSet);
			Assert.assertEquals(basicString, byteArray);
			Assert.assertEquals(71, byteArray.length);

			byteArray.compress();
			Assert.assertEquals(23, byteArray.length);

			byteArray.uncompress();
			Assert.assertEquals(71, byteArray.length);			
		}

	}
}

