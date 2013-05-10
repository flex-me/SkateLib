package org.component
{
	import org.domain.ImageXObject;
	import org.main.Writer;
	import org.util.StringTool;

	public class Image implements Component
	{
		private var imageXObject:ImageXObject;
		private var positionX:Number;
		private var positionY:Number;
		private var scale:Number;

		public function Image(imageXObject:ImageXObject, positionX:Number, positionY:Number, scale:Number=1){
			this.imageXObject = imageXObject;
			this.positionX = positionX;
			this.positionY = positionY;
			this.scale = scale;
		}

		public function getPositionX():Number{
			return this.positionX;
		}

		public function getPositionY():Number{
			return this.positionY;
		}

		public function getImageXObject():ImageXObject{
			return imageXObject;
		}

		public function toStreamValue():String{
			var streamValue:String = StringTool.setValue("q {0} 0 0 {1} {2} {3} cm", 
				[imageXObject.image.width * scale, imageXObject.image.height * scale, positionX, positionY]) + Writer.endOfLine;
			streamValue += StringTool.setValue("/{0} Do Q", [imageXObject.shortXObjectName]) +Writer.endOfLine;
			return streamValue;
		}

		//Refactor: all other components should have this function. 
		public function equals(image:Image):Boolean{
			return this.toStreamValue() == image.toStreamValue();
		}

	}
}

