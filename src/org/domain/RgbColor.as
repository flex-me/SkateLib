package org.domain
{
	public class RgbColor
	{
		//http://www.computerhope.com/htmcolor.htm
		public static var Red:RgbColor = RgbColor.hexStringToRGBColor("#FF0000");
		public static var Turquoise:RgbColor = RgbColor.hexStringToRGBColor("#00FFFF");
		public static var LightBlue:RgbColor = RgbColor.hexStringToRGBColor("#0000FF");
		public static var DarkBlue:RgbColor = RgbColor.hexStringToRGBColor("#0000A0");
		public static var LightPurple:RgbColor = RgbColor.hexStringToRGBColor("#FF0080");
		public static var DarkPurple:RgbColor = RgbColor.hexStringToRGBColor("#800080");
		public static var Yellow:RgbColor = RgbColor.hexStringToRGBColor("#FFFF00");
		public static var PastelGreen:RgbColor = RgbColor.hexStringToRGBColor("#00FF00");
		public static var Pink:RgbColor = RgbColor.hexStringToRGBColor("#FF00FF");
		public static var White:RgbColor = RgbColor.hexStringToRGBColor("#FFFFFF");
		public static var LightGrey:RgbColor = RgbColor.hexStringToRGBColor("#C0C0C0");
		public static var DarkGrey:RgbColor = RgbColor.hexStringToRGBColor("#808080");
		public static var Black:RgbColor = RgbColor.hexStringToRGBColor("#000000");
		public static var Orange:RgbColor = RgbColor.hexStringToRGBColor("#FF8040");
		public static var Brown:RgbColor = RgbColor.hexStringToRGBColor("#804000");
		public static var Burgundy:RgbColor = RgbColor.hexStringToRGBColor("#800000");
		public static var ForestGreen:RgbColor = RgbColor.hexStringToRGBColor("#808000");
		public static var GrassGreen:RgbColor = RgbColor.hexStringToRGBColor("#408080");

		public var red:Number;
		public var green:Number;
		public var blue:Number;

		public function RgbColor(red:Number, green:Number, blue:Number)
		{
			this.red = red;
			this.green = green;
			this.blue = blue;
		}

		public function equals(rgbColor:RgbColor):Boolean{
			if(this.red != rgbColor.red)return false;
			if(this.green != rgbColor.green)return false;
			if(this.blue != rgbColor.blue)return false;
			return true;
		}

		public static function numberToRgbColor(color:Number):RgbColor
		{
			var r:Number = (color >> 16) & 0xFF;
			var g:Number = (color >> 8) & 0xFF;
			var b:Number = color & 0xFF;
			return new RgbColor(r / 255, g / 255, b / 255);
		}

		public static function hexStringToRGBColor(hex:String):RgbColor{
			hex = hex.toLowerCase();
			if(hex.indexOf("0x") == 0){
				hex = hex.substr(2, hex.length - 2);
			}
			if(hex.indexOf("#") == 0){
				hex = hex.substr(1, hex.length - 1);
			}
			var c:Number = parseInt(hex, 16);
			return numberToRgbColor(c);
		}		
	}
}

