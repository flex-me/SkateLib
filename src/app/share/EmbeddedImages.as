package app.share
{
	public class EmbeddedImages
	{
		[Embed(source="/assets/BannerFrontPage.PNG", mimeType="application/octet-stream")]
		public static var BannerFrontPage:Class;

		[Embed(source="/assets/FooterFrontPage.PNG", mimeType="application/octet-stream")]
		public static var FooterFrontPage:Class;

		[Embed(source="/assets/Chart.PNG", mimeType="application/octet-stream")]
		public static var Chart:Class;

		[Embed(source="/assets/MyPhoto.PNG", mimeType="application/octet-stream")]
		public static var MyPhoto:Class;

		[Embed(source="/assets/Header.PNG", mimeType="application/octet-stream")]
		public static var Header:Class;

		[Embed(source="/assets/Footer.PNG", mimeType="application/octet-stream")]
		public static var Footer:Class;
	}
}

