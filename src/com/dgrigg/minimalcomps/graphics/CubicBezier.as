/**
 * CubicBezier.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Draws a curve using the cubic bezier formula.
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
	import flash.geom.Point;
	
	public class CubicBezier extends Geometry 
	{
		
		//control points
		public var cp1:Point;
		public var cp2:Point;
		public var cp3:Point;
		public var cp4:Point;
		
		//anchor points
		public var ap1:Point;
		public var ap2:Point;
		public var ap3:Point;
		public var ap4:Point;
		
		
		
		public function CubicBezier()
		{
		}
		
		/**
		 * Ported version of Tim Grouleau's AS2 Bezier functions
		 * http://timotheegroleau.com/Flash/articles/cubic_bezier/bezier_lib.as
		 */
		override public function set data(value:String):void 
		{
			_data = value;
			
			Logger.log("data: "+ value);
			
			var args:Array = value.split(" ");
			if (args.length == 8)
			{
				
				var p1:Point = new Point (args[0], args[1]);
				var p2:Point = new Point (args[2], args[3]);
				var p3:Point = new Point (args[4], args[5]);
				var p4:Point = new Point (args[6], args[7]);
				
				// calculates the useful base points
				var pA:Point = getPointOnSegment(p1, p2, 3/4);
				var pB:Point = getPointOnSegment(p4, p3, 3/4);
				
				// get 1/16 of the [P3, P0] segment
				var dx:Number = (p4.x - p1.x)/16;
				var dy:Number = (p4.y - p1.y)/16;
				
				// calculates control point 1
				cp1 = getPointOnSegment(p1, p2, 3/8);
				
				// calculates control point 2
				cp2 = getPointOnSegment(pA, pB, 3/8);
				
				cp2.x -= dx;
				cp2.y -= dy;
				
				// calculates control point 3
				cp3 = getPointOnSegment(pB, pA, 3/8);
				cp3.x += dx;
				cp3.y += dy;
				
				// calculates control point 4
				cp4 = getPointOnSegment(p4, p3, 3/8);
				
				// calculates the 3 anchor points
				ap1 = getMiddle(cp1, cp2);
				ap2 = getMiddle(pA, pB);
				ap3 = getMiddle(cp3, cp4);
				ap4 = p4;
			}
			
		}
		
	
		override public function draw(graphics:Graphics):void
		{
			
			// draw the four quadratic subsegments
			graphics.curveTo(cp1.x, cp1.y, ap1.x, ap1.y);
			graphics.curveTo(cp2.x, cp2.y, ap2.x, ap2.y);
			graphics.curveTo(cp3.x, cp3.y, ap3.x, ap3.y);
			graphics.curveTo(cp4.x, cp4.y, ap4.x, ap4.y);
			
		}
		
		
		protected function getMiddle (p0:Point, p1:Point):Point 
		{
				return new Point(((p0.x + p1.x) / 2), ((p0.y + p1.y) / 2));
		}
		
		
		// return a point on a segment [P0, P1] which distance from P0
		// is ratio of the length [P0, P1]
		protected function getPointOnSegment (p0:Point, p1:Point, ratio:Number):Point 
		{
			return new Point((p0.x + ((p1.x - p0.x) * ratio)), (p0.y + ((p1.y - p0.y) * ratio)));
		}
			
			


	}
}