package org.mock
{
	public class ManyTextPageMockData implements MockData
	{
		public function createObjectNumbers():Array{
			return [1, 2, 4, 3, 5, 6, 7];
		}

		public function createObjectXmls():Array{
			var objectXmls:Array = new Array();
			objectXmls.push(<Content>
					<![CDATA[1 0 obj
<</Type /Pages
/Kids [2 0 R]
/Count 1>>
endobj
]]>
				</Content>);
			objectXmls.push(<Content>
					<![CDATA[2 0 obj
<</Type /Page
/Parent 1 0 R
/MediaBox [0 0 595.28 841.89]
/Resources 3 0 R
/Rotate 0
/Contents 4 0 R>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[4 0 obj
<</Length 91>>
stream
BT
/F5 72 Tf
72 720 Td
(Hello World) Tj
ET
BT
/F5 36 Tf
144 360 Td
(You are welcome) Tj
ET
endstream
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[3 0 obj
<<
/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]
/Font <<
/F5 5 0 R
>>
/XObject <<
>>
/ColorSpace <<
>>
/Shading <<
>>
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[5 0 obj
<</Type /Font
/BaseFont /Helvetica
/Subtype /Type1
/Encoding /WinAnsiEncoding
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[6 0 obj
<<
/Producer (AlivePDF 0.1.5 RC)
/CreationDate (D:201009251322)
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[7 0 obj
<<
/Type /Catalog
/Pages 1 0 R
/OpenAction [2 0 R /FitH null]
/PageLayout /SinglePage
/PageMode /UseNone
>>
endobj
]]>
				</Content>);
			return objectXmls;
		}

	}
}

