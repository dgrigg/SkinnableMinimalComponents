/**
 * Rect.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Draws a rectangle using the drawing api.
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

package com.dgrigg.minimalcomps.graphics
{
	import com.dgrigg.minimalcomps.graphics.Shape;
	
	import flash.display.Graphics;
	import com.dgrigg.utils.Logger;
	
	public class Rect extends Shape
	{
		
		public var radiusX:Number = 0;
		public var radiusY:Number = 0;
		
		public var bottomLeftRadius:Number = 0;
		public var bottomRightRadius:Number = 0;
		public var topLeftRadius:Number = 0;
		public var topRightRadius:Number = 0;
		
		override protected function draw():void
		{
			super.draw();
			
			if (radiusX != 0 || radiusY != 0)
			{
				graphics.drawRoundRect(0, 0, width, height, radiusX, radiusY);
			}
			else if (bottomLeftRadius != 0 || bottomRightRadius != 0 || topLeftRadius != 0 || topRightRadius != 0)
			{
				graphics.drawRoundRectComplex(0, 0, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
			}
			else
			{
				graphics.drawRect(0,0, width, height);
				
			}
			
		}
		
		
		
	}
}