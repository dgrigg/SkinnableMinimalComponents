package
{
	import com.bit101.components.*;
	
	import flash.display.Sprite;
	
	public class SkinDemo extends Sprite
	{
		public function SkinDemo()
		{
			super();
			
			var vbox:VBox = new VBox(this, 10, 10);
			vbox.setSize(400, 400);
			vbox.width = 400;
			vbox.height = 400;
			
			
			var label:Label = new Label(vbox);
			
			label.text = "Hello World";
			
			var button:PushButton = new PushButton(vbox);
			button.label = "Push me";
			
			var checkbox:CheckBox = new CheckBox(vbox);
			checkbox.label = "Check me";
			
			var hslider:HSlider = new HSlider(vbox);
			
			var text:Text = new Text(vbox);
			text.text = "Hello World";
		}
	}
}