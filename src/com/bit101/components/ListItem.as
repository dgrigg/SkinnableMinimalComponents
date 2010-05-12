/**
 * ListItem.as
 * Keith Peters
 * version 0.9.2
 * 
 * A single item in a list. 
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
	import com.dgrigg.minimalcomps.skins.ListItemSkin;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import com.dgrigg.utils.Logger;
	
	public class ListItem extends Component
	{
		protected var _data:Object;
		
		//skin part
		protected var _label:Label;
		//end skin part
		
		
		protected var _selected:Boolean;
		protected var _mouseOver:Boolean = false;
		
		/**
		 * Constructor
		 * @param parent The parent DisplayObjectContainer on which to add this ListItem.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param label The text to show in this item.
		 */
		public function ListItem(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, data:Object = null)
		{
			skinClass = com.dgrigg.minimalcomps.skins.ListItemSkin;
			
			_data = data;
			
			super(parent, xpos, ypos);
		}
		
		/**
		 * Initilizes the component.
		 */
		protected override function init() : void
		{
			super.init();
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			setSize(100, 20);
		}
		
		/**
		 * handle skin parts as they are added
		 */
		override protected function skinPartAdded(part:String, instance:Object):void 
		{
			super.skinPartAdded(part, instance);
			switch (part)
			{
				case "label":
					_label = instance as Label;
					break;
			}
		}
		
		/**
		 * determine the current state for the skin to display
		 */
		override public function getCurrentSkinState():String 
		{
			if (_selected)
			{
				return "selected";
			}
			else if (_mouseOver)
			{
				return "over";
			}
			else
			{
				return "up";
			}
		}
		
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		/**
		 * Draws the visual ui of the component.
		 */
		public override function draw() : void
		{
			super.draw();
			graphics.clear();
			
		}
		
		
		
		
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		/**
		 * Called when the user rolls the mouse over the item. Changes the background color.
		 */
		protected function onMouseOver(event:MouseEvent):void
		{
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_mouseOver = true;
			invalidate();
		}
		
		/**
		 * Called when the user rolls the mouse off the item. Changes the background color.
		 */
		protected function onMouseOut(event:MouseEvent):void
		{
			removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_mouseOver = false;
			invalidate();
		}
		
		
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		/**
		 * Sets/gets the string that appears in this item.
		 */
		public function set data(value:Object):void
		{
			_data = value;
			invalidate();
		}
		public function get data():Object
		{
			return _data;
		}
		
		/**
		 * Sets/gets whether or not this item is selected.
		 */
		public function set selected(value:Boolean):void
		{
			_selected = value;
			invalidate();
		}
		public function get selected():Boolean
		{
			return _selected;
		}
		
		/**
		 * Sets/gets the default background color of list items.
		 */
		/*
		public function set defaultColor(value:uint):void
		{
			_defaultColor = value;
			invalidate();
		}
		public function get defaultColor():uint
		{
			return _defaultColor;
		}
		*/
		
		/**
		 * Sets/gets the selected background color of list items.
		 */
		/*
		public function set selectedColor(value:uint):void
		{
			_selectedColor = value;
			invalidate();
		}
		public function get selectedColor():uint
		{
			return _selectedColor;
		}
		*/
		
		/**
		 * Sets/gets the rollover background color of list items.
		 */
		/*
		public function set rolloverColor(value:uint):void
		{
			_rolloverColor = value;
			invalidate();
		}
		public function get rolloverColor():uint
		{
			return _rolloverColor;
		}
		*/
		
	}
}