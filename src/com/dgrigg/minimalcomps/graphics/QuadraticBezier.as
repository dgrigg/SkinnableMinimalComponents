/**
 * QuadraticBezier.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Draws a curve using the quadratic bezier formula.
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
	import com.dgrigg.utils.Logger;
	
	import flash.display.Graphics;
	
	public class QuadraticBezier extends Geometry
	{
		
		public var cX:Number;
		public var cY:Number;
		
		
		
		public function QuadraticBezier()
		{
		}
		
		override public function set data(value:String):void 
		{
			_data = value;
			
			
			var args:Array = value.split(" ");
			if (args.length == 4)
			{
				cX = args[0];
				cY = args[1];
				x = args[2];
				y = args[3];
			}
			else
			{
				Logger.log("invalid data");
			}
		}
	
		
		override public function draw(graphics:Graphics):void
		{
			graphics.curveTo(cX, cY, x, y);
		}
		
	
	}
}