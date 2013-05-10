package org.basic
{
	import flexunit.framework.Assert;

	import org.mock.MockDataCreator;

	public class TestXml
	{

		[Test]
		public function testXmlToString():void{
			var xml:XML = <Content>abc</Content>;

			Assert.assertEquals("abc", xml.toString());
			Assert.assertEquals("abc", xml);
			Assert.assertEquals(xml, xml.toString());

			var xmlString:String = xml.toXMLString();
			Assert.assertEquals("<Content>abc</Content>", xmlString);
		}

		[Test]
		public function testMultiLineXmlToString():void{
			var xml:XML = <Content>{"a\r\nbc"}</Content>;
			Assert.assertEquals("a\r\nbc", xml.toString());
			Assert.assertEquals("a\r\nbc", xml);
			Assert.assertEquals(xml, xml.toString());

			var xmlString:String = xml.toXMLString();
			Assert.assertEquals("<Content>a\r\nbc</Content>", xmlString);
		}

		[Test]
		public function testXmlWithCDATA():void{
			var xml:XML = <Content><![CDATA[abc]]></Content>;

			Assert.assertEquals("abc", xml.toString());
			Assert.assertEquals("abc", xml);
			Assert.assertEquals(xml, xml.toString());

			var xmlString:String = xml.toXMLString();
			Assert.assertEquals("<Content><![CDATA[abc]]></Content>", xmlString);
		}

		[Test]
		public function testMultiLineXmlWithCDATA():void{
			var xml:XML = <Content><![CDATA[a
bc]]></Content>;

			Assert.assertEquals("a\r\nbc", xml.toString());
			Assert.assertEquals("a\r\nbc", xml);
			Assert.assertEquals(xml, xml.toString());

			var xmlString:String = xml.toXMLString();
			Assert.assertEquals("<Content><![CDATA[a\r\nbc]]></Content>", xmlString);
		}

		[Test]
		public function testCombineTwoXml():void{
			var xml0:XML = <Content><![CDATA[a
]]></Content>;
			var xml1:XML = <Content><![CDATA[bc]]></Content>;
			var combinedXml:XML = MockDataCreator.createCdataXml(xml0.toString() + xml1.toString());
			var expectedCombinedXml:XML = <Content><![CDATA[a
bc]]></Content>;
			Assert.assertEquals(expectedCombinedXml.toString(), combinedXml.toString());
		}

		[Test]
		public function testCombineTwoMultiLineXml():void{
			var xml0:XML = <Content><![CDATA[a
]]></Content>;
			var xml1:XML = <Content><![CDATA[bc
]]></Content>;
			var combinedXml:XML = MockDataCreator.createCdataXml(xml0.toString() + xml1.toString());
			var expectedCombinedXml:XML = <Content><![CDATA[a
bc
]]></Content>;
			Assert.assertEquals(expectedCombinedXml.toString(), combinedXml.toString());
		}

		[Test]
		public function testCDATA():void{
			var xml:XML = MockDataCreator.createCdataXml("abc");
			var expectedXml:XML = <Content><![CDATA[abc]]></Content>;
			Assert.assertEquals(expectedXml, xml);
			Assert.assertEquals(expectedXml.toString(), xml.toString());
		}
	}
}












