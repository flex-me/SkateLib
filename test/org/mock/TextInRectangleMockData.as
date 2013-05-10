package org.mock
{
	public class TextInRectangleMockData implements MockData
	{
		public function createObjectNumbers():Array{
			return [1, 2, 4, 3, 5, 6, 7, 8];
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

			//fontY = rectangleY + 0.5 * rectangleHeight - 0.3 * fontSize
			//      = 600 + 0.5 * 100 - 0.3 * 36
			//      = 600 + 50 - 10.8 = 639.2 pt

			objectXmls.push(<Content>
					<![CDATA[4 0 obj
<</Length 120>>
stream
1.0 0.75 0.0 RG
0.5 0.75 0.5 rg
5 w
100 600 400 100 re
B
0.5 0.25 0.0 rg
BT
/F5 36 Tf
100 639.2 Td
(Hello World) Tj
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
/F1 6 0 R
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
<</Type /Font
/BaseFont /Times-Roman
/Subtype /Type1
/Encoding /WinAnsiEncoding
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[7 0 obj
<<
/Producer (AlivePDF 0.1.5 RC)
/CreationDate (D:201009251322)
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[8 0 obj
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

