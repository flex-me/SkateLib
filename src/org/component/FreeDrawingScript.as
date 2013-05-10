package org.component
{
	public class FreeDrawingScript implements Component
	{
		private var string:String;

		public function FreeDrawingScript(string:String)
		{
			this.string = string;
		}

		public function toStreamValue():String{
			return string;
		}

	}
}

