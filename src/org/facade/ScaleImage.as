package org.facade
{
	import org.component.Image;
	import org.domain.ImageXObject;

	public class ScaleImage
	{
		public var imageXObject:ImageXObject;
		public var scale:Number;

		public var controlCenter:ControlCenter;

		public function ScaleImage(imageXObject:ImageXObject, scale:Number)
		{
			this.imageXObject = imageXObject;
			this.scale = scale;
		}

		public function draw():void{
			var imageHeight:Number = imageXObject.image.height * scale;
			var computedEndPositionY:Number = controlCenter.currentPositionY + controlCenter.textHeight - imageHeight;
			controlCenter.checkAndNewPage(computedEndPositionY);
			controlCenter.currentPositionY = controlCenter.currentPositionY + controlCenter.textHeight - imageHeight;
			var image:Image = new Image(imageXObject, controlCenter.currentPositionX, controlCenter.currentPositionY, scale);
			controlCenter.document.addImage(image);
			controlCenter.addCarriageReturn();
		}
	}
}

