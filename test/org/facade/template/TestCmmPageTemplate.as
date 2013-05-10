package org.facade.template
{
	import app.share.EmbeddedImages;

	import flexunit.framework.Assert;

	import org.domain.Page;
	import org.main.Document;

	public class TestCmmPageTemplate
	{
		[Test]
		public function testDecorate():void{
			var document:Document = new Document();
			document.addPage();
			Assert.assertEquals(0, document.resources.imageXObjects.length);
			Assert.assertEquals(0, (document.pages.pageList[0] as Page).contents.components.length);
			var cmmPageTemplate:CmmPageTemplate = new CmmPageTemplate(
				new EmbeddedImages.BannerFrontPage(), 
				new EmbeddedImages.FooterFrontPage(), 
				new EmbeddedImages.Header(), 
				new EmbeddedImages.Footer()
				);
			cmmPageTemplate.decorate(document);
			Assert.assertEquals(2, document.resources.imageXObjects.length);
			document.addPage();
			cmmPageTemplate.decorate(document);
			Assert.assertEquals(4, document.resources.imageXObjects.length);
		}

	}
}

