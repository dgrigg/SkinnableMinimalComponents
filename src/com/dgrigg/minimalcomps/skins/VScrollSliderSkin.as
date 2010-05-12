/**
 * VScrollSliderSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default VScrollSlider skin.
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
	import com.bit101.components.Style;
	import com.bit101.components.VScrollSlider;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;
	import com.dgrigg.minimalcomps.graphics.SolidStroke;
	import com.dgrigg.utils.Logger;
	public class VScrollSliderSkin extends Skin
	{
		public var back:Rect;
		public var handle:Rect;
		
		public function VScrollSliderSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			back = new Rect();
			back.filters = [getShadow(2, true)];
			back.name = "back";
			var fill:SolidFill = new SolidFill();
			fill.color = Style.BACKGROUND;
			back.fill = fill;
			
			addChild(back);
			
			handle = new Rect();
			handle.filters = [getShadow(1)];
			fill = new SolidFill();
			fill.color = Style.BUTTON_FACE;
			handle.fill = fill;
			handle.x = 1;
			handle.y = 1;
			handle.name = "handle";
			handle.buttonMode = true;
			handle.useHandCursor = true;
			addChild(handle);
			
			invalidate();
			
		}
		
		
		
		override protected function draw():void 
		{
			super.draw();
			
			
			if (back)
			{
				back.width = width;
				back.height = height;
			}
			
			if (handle)
			{
				var host:VScrollSlider = hostComponent as VScrollSlider;
				handle.width = width-2;
				handle.height = host.getThumbPercent() * height;
			}
			
		}
	}
}