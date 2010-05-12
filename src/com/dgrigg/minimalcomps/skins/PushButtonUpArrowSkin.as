/**
 * PushButtonUpArrowSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default PushButtonUpArrow skin.
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
	import com.dgrigg.minimalcomps.graphics.Path;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;
	import com.dgrigg.minimalcomps.graphics.SolidStroke;
	import com.dgrigg.utils.Logger;
	
	import flash.display.Bitmap;
	import flash.events.Event;

	public class PushButtonUpArrowSkin extends Skin
	{
		public var back:Rect;
		public var face:Rect;
		public var arrow:Path;
		
		public function PushButtonUpArrowSkin()
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
			
			arrow = new Path();
			arrow.data = "M 5 3 L 7 6 L 3 6";
			fill = new SolidFill();
			fill.color = Style.DROPSHADOW;
			arrow.fill = fill;
			addChild(arrow);
			
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
			
			
			
			
		}
	}
}