/**
 * ScrollSlider.as
 * Derrick Grigg
 * version 0.0.1
 * 
 * Abstract base slider class for HScrollSlider and VScrollSlider.
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

package com.bit101.components
{
	
	import com.bit101.components.Slider;
	import com.bit101.components.Style;
	import com.dgrigg.minimalcomps.skins.HSliderSkin;
	import com.dgrigg.minimalcomps.skins.VSliderSkin;
	import com.dgrigg.utils.Logger;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	
	public class ScrollSlider extends Slider
	{
		protected var _thumbPercent:Number = 1.0;
		private var _pageSize:int = 1;
		
		/**
		 * Constructor
		 * @param orientation Whether this is a vertical or horizontal slider.
		 * @param parent The parent DisplayObjectContainer on which to add this Slider.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param defaultHandler The event handling function to handle the default event for this component (change in this case).
		 */
		public function ScrollSlider(orientation:String, parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function = null)
		{
			
			
			super(orientation, parent, xpos, ypos, defaultHandler);
			
		}
		
		/**
		 * Initializes the component.
		 */
		protected override function init():void
		{
			super.init();
			setSliderParams(1, 1, 0);
			backClick = true;
		}
		
		
		
		/**
		 * Adjusts position of handle when value, maximum or minimum have changed.
		 * TODO: Should also be called when slider is resized.
		 */
		
		protected override function positionHandle():void
		{
			
			var range:Number;
			if (_handle)
			{
				if(_orientation == HORIZONTAL)
				{
					range = width - _handle.width - (_horzGutter * 2);
					_handle.x = (_value - _min) / (_max - _min) * range + _horzGutter;
				}
				else
				{
					range = height - _handle.height; - (_vertGutter * 2);
					_handle.y = ((_value - _min) / (_max - _min) * range) - _vertGutter;
				}
			}
		}
		
		override protected function invalidate():void 
		{
			if (_skin)
			{	
				_skin.validate();
			}
			super.invalidate();
		}
	
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		/**
		 * Sets the percentage of the size of the thumb button.
		 */
		public function setThumbPercent(value:Number):void
		{
			_thumbPercent = Math.min(value, 1.0);
			invalidate();
		}
		
		public function getThumbPercent():Number 
		{
			return _thumbPercent;
		}
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		/**
		 * Handler called when user clicks the background of the slider, causing the handle to move to that point. Only active if backClick is true.
		 * @param event The MouseEvent passed by the system.
		 */
		protected override function onBackClick(event:MouseEvent):void
		{
			if(_orientation == HORIZONTAL)
			{
				if(mouseX < _handle.x)
				{
					if(_max > _min)
					{
						_value -= _pageSize;
					}
					else
					{
						_value += _pageSize;
					}
					correctValue();
				}
				else
				{
					if(_max > _min)
					{
						_value += _pageSize;
					}
					else
					{
						_value -= _pageSize;
					}
					correctValue();
				}
				positionHandle();
			}
			else
			{
				if(mouseY < _handle.y)
				{
					if(_max > _min)
					{
						_value -= _pageSize;
					}
					else
					{
						_value += _pageSize;
					}
					correctValue();
				}
				else
				{
					if(_max > _min)
					{
						_value += _pageSize;
					}
					else
					{
						_value -= _pageSize;
					}
					correctValue();
				}
				positionHandle();
			}
			dispatchEvent(new Event(Event.CHANGE));
			
		}
		
	
		/**
		 * Internal mouseMove handler for when the handle is being moved.
		 * @param event The MouseEvent passed by the system.
		 */
		protected override function onSlide(event:MouseEvent):void
		{
			var oldValue:Number = _value;
			if(_orientation == HORIZONTAL)
			{
				_value = _handle.x / (_width - _handle.width) * (_max - _min) + _min;
			}
			else
			{
				_value = _handle.y / (_height - _handle.height) * (_max - _min) + _min;
			}
			if(_value != oldValue)
			{
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		
		
		
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		/**
		 * Sets / gets the amount the value will change when the back is clicked.
		 */
		public function set pageSize(value:int):void
		{
			_pageSize = value;
			invalidate();
		}
		public function get pageSize():int
		{
			return _pageSize;
		}
	}
}