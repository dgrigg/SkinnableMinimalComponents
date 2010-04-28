/**
 * Shape.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Base class for creating shapes.
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
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Shape extends Sprite implements IGraphic
	{
		protected var _fill:IFill;
		protected var _stroke:IStroke;
		protected var _width:Number;
		protected var _height:Number;
		protected var _data:String;
		
		public function Shape()
		{
			_width = 1;
			_height = 1;
			
		}
		
		public function set data(value:String):void 
		{
			_data = value;
		}
		
		public function get data():String 
		{
			return _data;
		}
		
		
		
		override public function set width(value:Number):void 
		{
			_width = value;
		}
		
		override public function get width():Number 
		{
			return _width;
		}
		
		override public function set height(value:Number):void 
		{
			_height = value;
		}
		
		override public function get height():Number 
		{
			return _height;
		}
		
		
		
		public function set fill(value:IFill):void 
		{
			
			_fill = value;
			
		}
		
		public function get fill():IFill 
		{
			return _fill;
		}
		
		public function set stroke(value:IStroke):void 
		{
			_stroke = value;
		}
		
		public function get stroke():IStroke 
		{
			return _stroke;
		}
		
		public function validate():void 
		{
			invalidate();
		}
		
		protected function invalidate():void 
		{
			addEventListener(Event.ENTER_FRAME, onInvalidate, false, 0, true);
		}
		
		protected function onInvalidate(event:Event):void 
		{
			removeEventListener(Event.ENTER_FRAME, onInvalidate, false);
			draw();
		}
		
		protected function draw():void
		{
			graphics.clear();
			if (_fill)
			{
				_fill.width = _width;
				_fill.height = _height;
				_fill.draw(graphics);
			}
			
			if (_stroke)
			{
				_stroke.width = _width;
				_stroke.height = _height;
				_stroke.draw(graphics);
			}
		}
		
		public function endDraw():void 
		{
			
		}
		
		
		
		
	}
}