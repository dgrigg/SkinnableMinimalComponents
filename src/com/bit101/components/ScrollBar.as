/**
 * ScrollBar.as
 * Keith Peters
 * version 0.9.2
 * 
 * Base class for HScrollBar and VScrollBar
 * 
 * Copyright (c) 2010 Keith Peters
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
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import com.dgrigg.utils.Logger;
	
	[Event(name="change", type="flash.events.Event")]
	
	public class ScrollBar extends Component
	{
		protected const DELAY_TIME:int = 500;
		protected const REPEAT_TIME:int = 100; 
		protected const UP:String = "up";
		protected const DOWN:String = "down";
		
		//skin parts
		protected var _upButton:PushButton;
		protected var _downButton:PushButton;
		protected var _scrollSlider:ScrollSlider;
		//end skin parts
		
		protected var _orientation:String;
		protected var _lineSize:int = 1;
		protected var _delayTimer:Timer;
		protected var _repeatTimer:Timer;
		protected var _direction:String;
		
		/**
		 * Constructor
		 * @param orientation Whether this is a vertical or horizontal slider.
		 * @param parent The parent DisplayObjectContainer on which to add this Slider.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param defaultHandler The event handling function to handle the default event for this component (change in this case).
		 */
		public function ScrollBar(orientation:String, parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function = null)
		{
			_orientation = orientation;
			
			super(parent, xpos, ypos);
			if(defaultHandler != null)
			{
				addEventListener(Event.CHANGE, defaultHandler);
			}
		}
		
		
		/**
		 * Initializes the component.
		 */
		protected override function init():void
		{
			super.init();
			if(_orientation == Slider.HORIZONTAL)
			{
				setSize(100, 10);
			}
			else
			{
				setSize(10, 100);
			}
			_delayTimer = new Timer(DELAY_TIME, 1);
			_delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onDelayComplete);
			_repeatTimer = new Timer(REPEAT_TIME);
			_repeatTimer.addEventListener(TimerEvent.TIMER, onRepeat);
		}
		
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		/**
		 * Convenience method to set the three main parameters in one shot.
		 * @param min The minimum value of the slider.
		 * @param max The maximum value of the slider.
		 * @param value The value of the slider.
		 */
		public function setSliderParams(min:Number, max:Number, value:Number):void
		{
			if (_scrollSlider)
			{
				_scrollSlider.setSliderParams(min, max, value);
			}
		}
		
		/**
		 * Sets the percentage of the size of the thumb button.
		 */
		public function setThumbPercent(value:Number):void
		{
			if (_scrollSlider)
			{
				_scrollSlider.setThumbPercent(value);
				invalidate();
			}
		}
		
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		/**
		 * Sets / gets the current value of this scroll bar.
		 */
		public function set value(v:Number):void
		{
			if (_scrollSlider)
			{
				_scrollSlider.value = v;
			}
		}
		public function get value():Number
		{
			if (_scrollSlider)
			{
				return _scrollSlider.value;
			}
			else 
			{
				return 0;
			}
		}
		
		/**
		 * Sets / gets the amount the value will change when up or down buttons are pressed.
		 */
		public function set lineSize(value:int):void
		{
			_lineSize = value;
		}
		public function get lineSize():int
		{
			return _lineSize;
		}
		
		/**
		 * Sets / gets the amount the value will change when the back is clicked.
		 */
		public function set pageSize(value:int):void
		{
			if (_scrollSlider)
			{
				_scrollSlider.pageSize = value;
			}
			invalidate();
		}
		public function get pageSize():int
		{
			if (_scrollSlider)
			{
				return _scrollSlider.pageSize;
			}
			else
			{
				return 0;
			}
		}
		

		
		
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		protected function onUpClick(event:MouseEvent):void
		{
			goUp();
			_direction = UP;
			_delayTimer.start();
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
				
		protected function goUp():void
		{
			_scrollSlider.value -= _lineSize;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		protected function onDownClick(event:MouseEvent):void
		{
			goDown();
			_direction = DOWN;
			_delayTimer.start();
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		protected function goDown():void
		{
			_scrollSlider.value += _lineSize;
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			_delayTimer.stop();
			_repeatTimer.stop();
		}
		
		protected function onChange(event:Event):void
		{
			dispatchEvent(event);
		}
		
		protected function onDelayComplete(event:TimerEvent):void
		{
			_repeatTimer.start();
		}
		
		protected function onRepeat(event:TimerEvent):void
		{
			if(_direction == UP)
			{
				goUp();
			}
			else
			{
				goDown();
			}
		}
		
		override protected function skinPartAdded(part:String, instance:Object):void
		{
			super.skinPartAdded(part, instance);
			
			switch (part)
			{
				case "scrollSlider":
					_scrollSlider = instance as ScrollSlider;
					_scrollSlider.addEventListener(Event.CHANGE, onChange, false, 0, true);
					break;
				case "upButton":
					_upButton = instance as PushButton;
					_upButton.addEventListener(MouseEvent.MOUSE_DOWN, onUpClick);
					break;
				case "downButton":
					_downButton = instance as PushButton;
					_downButton.addEventListener(MouseEvent.MOUSE_DOWN, onDownClick);
					break;
			}
		}

	}

}


