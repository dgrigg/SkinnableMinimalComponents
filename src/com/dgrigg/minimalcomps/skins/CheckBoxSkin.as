/**
 * CheckBoxSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default Checkbox skin.
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
	import com.bit101.components.CheckBox;
	import com.bit101.components.Component;
	import com.bit101.components.Label;
	import com.bit101.components.Style;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;

	public class CheckBoxSkin extends Skin
	{
		public var label:Label;
		public var back:Rect;
		public var button:Rect;
		//protected var _hostComponent:CheckBox;
		
		public function CheckBoxSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			back = new Rect();
			
			var fill:SolidFill = new SolidFill();
			fill.color = Style.BACKGROUND;
			back.fill = fill;
			back.width = 10;
			back.height = 10;
			back.filters = [getShadow(2, true)];
			addChild(back);
			
			button = new Rect();
			button.x = 2;
			button.y = 2;
			button.height = 6;
			button.width = 6;
			fill = new SolidFill();
			fill.color = Style.BUTTON_FACE;
			button.fill = fill;
			button.filters = [getShadow(1)];
			button.visible = false;
			addChild(button);
			
			label = new Label();
			label.name = "label";
			addChild(label);
		}
		
		
		
		override protected function draw():void 
		{
			super.draw();
			
			width = hostComponent.width;
			height = hostComponent.height;
			
			
			button.visible = currentState == "selected";
			
			
			label.x = 12;
			label.y = (10 - label.height) / 2;
			
		}
	}
}