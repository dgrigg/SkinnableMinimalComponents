/**
 * TextArea.as
 * Keith Peters
 * version 0.9.2
 * 
 * A Text component for displaying multiple lines of text with a scrollbar.
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
	import com.dgrigg.minimalcomps.skins.TextAreaSkin;
	import com.dgrigg.utils.Logger;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	public class TextArea extends Text
	{
		protected var _scrollbar:VScrollBar;
		private var _dirtyScroller:Boolean = false;
		
		/**
		 * Constructor
		 * @param parent The parent DisplayObjectContainer on which to add this Label.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param text The initial text to display in this component.
		 */
		public function TextArea(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, text:String="")
		{
			skinClass = com.dgrigg.minimalcomps.skins.TextAreaSkin;
			super(parent, xpos, ypos, text);
			
		}
		
		/**
		 * Creates and adds the child display objects of this component.
		 */
		/*
		override protected function addChildren():void
		{
			super.addChildren();
			
		}
		*/
		
		/**
		 * Changes the thumb percent of the scrollbar based on how much text is shown in the text area.
		 */
		protected function updateScrollbar():void
		{
			if (_tf)
			{
				var visibleLines:int = _tf.numLines - _tf.maxScrollV + 1;
				var percent:Number = visibleLines / _tf.numLines;
				
				if (_scrollbar)
				{
					_scrollbar.setSliderParams(1, _tf.maxScrollV, _tf.scrollV);
					_scrollbar.setThumbPercent(percent);
					_scrollbar.pageSize = visibleLines;
					
					_dirtyScroller = true;
					invalidate();
					
				}
			}
			
			
			
		}
		
		
		override protected function skinPartAdded(part:String, instance:Object):void
		{
			super.skinPartAdded(part, instance);
			
			switch (part)
			{
				case "textField":
					_tf.addEventListener(Event.SCROLL, onTextScroll);
					_tf.addEventListener(Event.CHANGE, onChange);
					
					break;
				case "scrollBar":
					_scrollbar = instance as VScrollBar;
					_scrollbar.addEventListener(Event.CHANGE, onScrollbarScroll);
					break;
			}
		}
		
		
		
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		/**
		 * Draws the visual ui of the component.
		 */
		override public function draw():void
		{
			super.draw();
			
			_skin.validate();
			
			addEventListener(Event.ENTER_FRAME, onTextScrollDelay);
			
		}
			
		
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		/**
		 * Waits one more frame before updating scroll bar.
		 * It seems that numLines and maxScrollV are not valid immediately after changing a TextField's size.
		 */
		protected function onTextScrollDelay(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, onTextScrollDelay);
			if (_dirtyScroller)
			{
				updateScrollbar();
			}
			_dirtyScroller = false;
		}
		
		/**
		 * Called when the text in the text field is manually changed.
		 */
		protected override function onChange(event:Event):void
		{
			super.onChange(event);
			updateScrollbar();
		}
		
		/**
		 * Called when the scroll bar is moved. Scrolls text accordingly.
		 */
		protected function onScrollbarScroll(event:Event):void
		{
			if (_tf && _scrollbar)
			{
				_tf.scrollV = Math.round(_scrollbar.value);
			}
		}
		
		/**
		 * Called when the text is scrolled manually. Updates the position of the scroll bar.
		 */
		protected function onTextScroll(event:Event):void
		{
			if (_tf && _scrollbar)
			{
				_scrollbar.value = _tf.scrollV;
				updateScrollbar();
			}
		}
	}
}