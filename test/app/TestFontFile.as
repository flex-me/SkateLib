package app
{
	import flash.utils.ByteArray;
	import org.flexunit.Assert;

	public class TestFontFile
	{
		//Refactor: the file is too big to slow the application. 
		[Embed(source="/assets/arial.ttf", mimeType="application/octet-stream")]
		public static var FontStreamArial:Class;

		//Refactor: should remove this field. 
		public static var fontStreamArial:ByteArray = new FontStreamArial();

		[Embed(source="/assets/temp.ttf", mimeType="application/octet-stream")]
		private static var TempFile:Class;

		[Test]
		public function testWriteBytes():void{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeBytes(fontStreamArial);
			Assert.assertEquals(367112, byteArray.length);
			byteArray.writeBytes(fontStreamArial);
			Assert.assertEquals(367112 * 2, byteArray.length);
		}

		[Test]
		public function testStringLimit():void{
			var string:String = "";
			var limit:Number = 367112;
			for(var i:Number = 0 ; i < limit ; i++){
				string += "a";
			}
			Assert.assertEquals(limit, string.length);
		}

		[Test]
		public function testShowFontFile():void{
			Assert.assertEquals(367112, fontStreamArial.length);
			fontStreamArial.compress();
			Assert.assertEquals(197865, fontStreamArial.length);
			fontStreamArial.uncompress();
			Assert.assertEquals(367112, fontStreamArial.length);
		}

		public static function equalsByteArray(byteArray0:ByteArray, byteArray1:ByteArray):void{
			Assert.assertEquals(byteArray0.length, byteArray1.length);
			for(var i:int = 0 ; i < byteArray0.length ; i++){
				Assert.assertEquals(byteArray0[i], byteArray1[i]);
			}
		}		

		[Test]
		public function testUncompressToString():void{
			var byteArray:ByteArray = new TempFile();
			Assert.assertEquals(65, byteArray.length);

			Assert.assertEquals("s", String.fromCharCode(byteArray[0]));
			Assert.assertEquals("t", String.fromCharCode(byteArray[1]));
			Assert.assertEquals("r", String.fromCharCode(byteArray[2]));
			Assert.assertEquals("e", String.fromCharCode(byteArray[3]));
			Assert.assertEquals("a", String.fromCharCode(byteArray[4]));
			Assert.assertEquals("m", String.fromCharCode(byteArray[5]));

			Assert.assertEquals("\r", String.fromCharCode(byteArray[6]));
			Assert.assertEquals("\n", String.fromCharCode(byteArray[7]));

			Assert.assertEquals("e", String.fromCharCode(byteArray[56]));
			Assert.assertEquals("n", String.fromCharCode(byteArray[57]));
			Assert.assertEquals("d", String.fromCharCode(byteArray[58]));
			Assert.assertEquals("s", String.fromCharCode(byteArray[59]));
			Assert.assertEquals("t", String.fromCharCode(byteArray[60]));
			Assert.assertEquals("r", String.fromCharCode(byteArray[61]));
			Assert.assertEquals("e", String.fromCharCode(byteArray[62]));
			Assert.assertEquals("a", String.fromCharCode(byteArray[63]));
			Assert.assertEquals("m", String.fromCharCode(byteArray[64]));


			var valuePart:ByteArray = new ByteArray();
			for(var i:int = 8 ; i < 56 ; i++){
				valuePart.writeByte(byteArray[i]);
			}

			Assert.assertEquals(48, valuePart.length);
		}
	}
}

















