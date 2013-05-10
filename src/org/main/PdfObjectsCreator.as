package org.main
{
	import mx.collections.ArrayCollection;

	import org.main.Document;
	import org.util.ObjectNumberMaker;

	public class PdfObjectsCreator
	{
		private var document:Document;

		public function PdfObjectsCreator(document:Document)
		{
			this.document = document;
		}

		public function createPdfObjects():ArrayCollection{
			var pdfObjects:ArrayCollection = new ArrayCollection();
			//Refactor: should treat document.pages as an Element. 
			pdfObjects.addAll(document.pages.toPdfObjects());
			pdfObjects.addAll(document.resources.toPdfObjects());
			pdfObjects.addAll(document.info.toPdfObjects());
			pdfObjects.addAll(document.catalog.toPdfObjects());
			ObjectNumberMaker.reset();
			return pdfObjects;
		}

		public function createTrailer():Trailer{
			var pdfObjects:ArrayCollection = createPdfObjects();
			var trailer:Trailer = new Trailer(pdfObjects);
			trailer.catalog = document.catalog;
			trailer.info = document.info;
			return trailer;
		}

	}
}

