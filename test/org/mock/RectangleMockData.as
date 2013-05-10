package org.mock
{
	public class RectangleMockData implements MockData
	{

		public function createObjectNumbers():Array{
			return [1, 2, 3, 4, 5, 6, 7];
		}

		public function createObjectXmls():Array{
			var objectXmls:Array = new Array();
			objectXmls.push(<Content>
					<![CDATA[1 0 obj
<</Type /Catalog
/Outlines 2 0 R
/Pages 3 0 R
>>
endobj
]]>
				</Content>);
			objectXmls.push(<Content>
					<![CDATA[2 0 obj
<</Type /Outlines
/Count 0
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[3 0 obj
<</Type /Pages
/Kids [4 0 R]
/Count 1
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[4 0 obj
<</Type /Page
/Parent 3 0 R
/MediaBox [0 0 612 792]
/Contents 5 0 R
/Resources <</ProcSet 6 0 R>>
>>
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[5 0 obj
<</Length 165>>
stream
5 w
1.0 0.75 0.0 RG
0.5 0.75 0.5 rg
200 600 50 75 re
B
5 w
1.0 0.75 0.0 RG
0.5 0.75 0.5 rg
300 600 50 75 re
B
2.2 w
0.5 0.5 0.5 RG
400 600 m
500 600 l
500 700 l
S
endstream
endobj
]]>
				</Content>);

			objectXmls.push(<Content>
					<![CDATA[6 0 obj
[ /PDF ]
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
			return objectXmls;
		}

	}
}

