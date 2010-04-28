/**
 * BitmapImage.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * A component for adding raster images (ie png, jpg).
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
	import com.dgrigg.minimalcomps.skins.ISkinElement;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.describeType;
	
	
	public class BitmapImage extends Sprite implements ISkinElement
	{
		public var _source:Class;
		
		//using a Display object so we can straight Bitmaps
		//or Bitmaps with Scale9 applied which convert to Sprites
		protected var _image:DisplayObject;
		
		protected var _height:Number = 0;
		protected var _width:Number = 0;
		
		public function BitmapImage()
		{
			super();
			
		}
		
		override public function set height(value:Number):void 
		{
			_height = value;
			invalidate();
		}
		
		override public function get height():Number 
		{
			return _height;
		}
		
		override public function set width(value:Number):void 
		{
			_width = value;
			invalidate();
		}
		
		override public function get width():Number 
		{
			return _width;
		}
		
		public function set image(value:DisplayObject):void 
		{
			if (_image)
			{
				removeChild(_image);
			}
			
			_image = value;
			addChild(value);
			
		}
		
		public function get image():DisplayObject 
		{
			return _image;
		}
		
		public function set source(value:Class):void 
		{
			if (_image)
			{
				this.removeChild(_image);
			}
		
			image = new value();
			
		}
		
		public function get source():Class 
		{
			return _source;
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
			
			if (_image)
			{
				_image.width = _width;
				_image.height = _height;
			}
			
		}
		
	}
}