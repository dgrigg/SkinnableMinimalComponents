/**
 * Geometry.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Base class for geometric elements.
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
	
	import flash.display.Graphics;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Geometry implements IGeometry
	{
		
		public var x:Number;
		public var y:Number;
		protected var _data:String;
		protected var _graphics:Graphics;
		
		public function Geometry()
		{
			//super(target);
		}
		
		public function set data(value:String):void 
		{
			_data = value;
		}
		
		public function get data():String 
		{
			return _data;
		}
		
		public function set graphics(value:Graphics):void
		{
			_graphics = value;
		}
		
		public function get graphics():Graphics
		{
			return null;
		}
		
		public function endDraw(graphics:Graphics):void
		{
		}
		
		public function draw(graphics:Graphics):void
		{
			
		}
		
		public function invalidate():void 
		{
			
		}
		
		
	}
}