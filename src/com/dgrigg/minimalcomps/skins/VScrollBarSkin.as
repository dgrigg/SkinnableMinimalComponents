/**
 * VScrollBarSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default VScrollBarSkin skin.
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
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;
	import com.bit101.components.VScrollBar;
	import com.bit101.components.VScrollSlider;
	import com.bit101.components.VSlider;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;
	import com.dgrigg.minimalcomps.graphics.SolidStroke;
	import com.dgrigg.utils.Logger;

	public class VScrollBarSkin extends Skin
	{
		
		public var scrollSlider:VScrollSlider;
		public var upButton:PushButton;
		public var downButton:PushButton;
		
		public function VScrollBarSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			scrollSlider = new VScrollSlider();
			scrollSlider.name = "scrollSlider";
			addChild(scrollSlider);
			
			upButton = new PushButton();
			upButton.name = "upButton";
			upButton.skinClass = com.dgrigg.minimalcomps.skins.PushButtonUpArrowSkin;
			addChild(upButton);
			
			downButton = new PushButton();
			downButton.name = "downButton";
			downButton.skinClass = com.dgrigg.minimalcomps.skins.PushButtonDownArrowSkin;
			addChild(downButton);
			
			invalidate();
			
		}
		
		
		
		override protected function draw():void 
		{
			super.draw();
			
			if (upButton)
			{
				upButton.width = width;
				upButton.height = width;
			}
			
			if (downButton)
			{
				downButton.width = width;
				downButton.height = width;
				downButton.y = height - width;
			}
			
			if (scrollSlider)
			{
				scrollSlider.width = width;
				scrollSlider.height = height - upButton.height - downButton.height;
				scrollSlider.y = upButton.y + upButton.height;
				
			}
			
			
		}
	}
}