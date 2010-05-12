/**
 * PushButtonSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default PushButton skin.
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

package com.dgrigg.minimalcomps.skins
{
	import com.bit101.components.Component;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;
	import com.dgrigg.minimalcomps.graphics.SolidStroke;
	import com.dgrigg.utils.Logger;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.text.TextFormat;

	public class PushButtonSkin extends Skin
	{
		public var back:Rect;
		public var face:Rect;
		public var label:Label;
		
		
		public function PushButtonSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var stroke:SolidStroke;
			var fill:SolidFill;
			
			back = new Rect();
			fill = new SolidFill();
			fill.color = Style.BACKGROUND;
			back.fill = fill;
			back.filters = [getShadow(2, true)];
			addChild(back);
			
			face = new Rect();
			fill = new SolidFill();
			fill.color = Style.BUTTON_FACE;
			face.x = 1;
			face.y = 1;
			face.filters = [getShadow(1)];
			face.fill = fill;
			addChild(face);
			
			label = new Label();
			label.name = "label";
			label.addEventListener(Event.RESIZE, onLabelResize, false, 0, true);
			addChild(label);
			
			invalidate();
			
		}
		
		private function onLabelResize(event:Event):void 
		{
			invalidate();
		}
		
		
		override protected function draw():void 
		{
			
			super.draw();
			
			if (back)
			{
				back.width = width;
				back.height = height;
				
				back.validate();
			}
			
			
			if (face)
			{
				face.width = width-2;
				face.height = height-2;
			
				face.validate();
				
				if (currentState == "up" ||  currentState == "over")
				{
				
					face.filters = [getShadow(1)];
				} 
				else if (currentState == "down")
				{
					face.filters = [getShadow(1, true)];
				}
			}
			
			
			
			if (label)
			{
				
				var host:PushButton = hostComponent as PushButton;
				label.text = host.label;
				
				var tf:TextFormat = label.textField.defaultTextFormat;
				
				if (currentState == "over")
				{
					tf.color = 0x000000;
				}
				else
				{
					tf.color = 0xCCCCCC;
				}
				
				label.textField.defaultTextFormat = tf;
				
				if(label.width > _width - 4)
				{
					label.autoSize = false;
					label.width = _width - 4;
				}
				else
				{
					label.autoSize = true;
				}
				
				
				label.move(_width / 2 - label.width / 2, _height / 2 - label.height / 2);
			}
		}
	}
}