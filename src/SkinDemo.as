/**
 * SkinDemo.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Demo application to show the Skinnable Minimal Compoenents.
 * 
 * Copyright (c) 2010 Derrick Grigg
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package
{
	import com.bit101.components.*;
	import com.dgrigg.skins.ButtonImageSkin;
	
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
			button.skinClass = com.dgrigg.skins.ButtonImageSkin;
			button.label = "Push me to";
			//vbox.addChild(button);
			
			
			var checkbox:CheckBox = new CheckBox(vbox);
			checkbox.label = "Check me";
			
			var hslider:HSlider = new HSlider(vbox);
			
			var text:Text = new Text(vbox);
			text.text = "Hello World";
		}
	}
}