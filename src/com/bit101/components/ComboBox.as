/**
 * ComboBox.as
 * Keith Peters
 * version 0.9.2
 * 
 * A button that exposes a list of choices and displays the chosen item. 
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
	import com.dgrigg.minimalcomps.skins.ComboBoxSkin;
	import com.dgrigg.utils.Logger;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	
	
	public class ComboBox extends Component
	{
		public static const TOP:String = "top";
		public static const BOTTOM:String = "bottom";
		
		protected var _defaultLabel:String = "";
		protected var _dropDownButton:PushButton;
		protected var _items:Array;
		protected var _labelButton:PushButton;
		protected var _list:List;
		protected var _numVisibleItems:int = 6;
		protected var _open:Boolean = false;
		protected var _openPosition:String = BOTTOM;
		protected var _stage:Stage;
		
		
		/**
		 * Constructor
		 * @param parent The parent DisplayObjectContainer on which to add this List.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param defaultLabel The label to show when no item is selected.
		 * @param items An array of items to display in the list. Either strings or objects with label property.
		 */
		public function ComboBox(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultLabel:String="", items:Array = null)
		{
			skinClass = com.dgrigg.minimalcomps.skins.ComboBoxSkin;
			_defaultLabel = defaultLabel;
			_items = items;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			super(parent, xpos, ypos);
		}
		
		/**
		 * Initilizes the component.
		 */
		protected override function init():void
		{
			super.init();
			setSize(100, 20);
		}
		
		
		
		/**
		 * Determines what to use for the main button label and sets it.
		 */
		protected function setLabelButtonLabel():void
		{
			if (_labelButton)
			{
				if(selectedItem == null)
				{
					_labelButton.label = _defaultLabel;
				}
				else if(selectedItem is String)
				{
					_labelButton.label = selectedItem as String;
				}
				else if(selectedItem.label is String)
				{
					_labelButton.label = selectedItem.label;
				}
				else
				{
					_labelButton.label = selectedItem.toString();
				}
			}
		}
		
		
		override protected function skinPartAdded(part:String, instance:Object):void 
		{
			super.skinPartAdded(part, instance);
			
			switch (part)
			{
				case "list":
					_list = instance as List;
					//remove list from skin to hide it while in the closed state
					skin.removeChild(_list);
					_list.addEventListener(Event.SELECT, onSelect, false, 0, true);
					_list.items = _items;
					break;
				case "labelButton":
					_labelButton = instance as PushButton;
					_labelButton.addEventListener(MouseEvent.CLICK, onDropDown, false, 0, true);
					setLabelButtonLabel();
					break;
				case "dropDownButton":
					_dropDownButton = instance as PushButton;
					_dropDownButton.addEventListener(MouseEvent.CLICK, onDropDown, false, 0, true);
					break;
			}
			
		}
		
		/**
		 * control the states for the skin
		 */
		override public function getCurrentSkinState():String 
		{
			if (_open)
			{
				return "open";
			}
			else
			{
				return "closed";
			}
		}

		
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		public override function draw():void
		{
			
			
			if(_open)
			{
				var point:Point = new Point();
				if(_openPosition == BOTTOM)
				{
					point.y = _height;
				}
				else
				{
					point.y = -_numVisibleItems * _list.listItemHeight;
				}
				point = this.localToGlobal(point);
				_list.move(point.x, point.y);
				_stage.addChild(_list);
				_stage.addEventListener(MouseEvent.CLICK, onStageClick);
				
			}
			else
			{
				if(_stage.contains(_list))
				{
					_stage.removeChild(_list);
				}
				_stage.removeEventListener(MouseEvent.CLICK, onStageClick);
			}
	
			super.draw();
			
		}
		
		
		
		/**
		 * Adds an item to the list.
		 * @param item The item to add. Can be a string or an object containing a string property named label.
		 */
		public function addItem(item:Object):void
		{
			if (_list)
			{
				_list.addItem(item);
			}
		}
		
		/**
		 * Adds an item to the list at the specified index.
		 * @param item The item to add. Can be a string or an object containing a string property named label.
		 * @param index The index at which to add the item.
		 */
		public function addItemAt(item:Object, index:int):void
		{
			if (_list)
			{
				_list.addItemAt(item, index);
			}
		}
		
		/**
		 * Removes the referenced item from the list.
		 * @param item The item to remove. If a string, must match the item containing that string. If an object, must be a reference to the exact same object.
		 */
		public function removeItem(item:Object):void
		{
			if (_list)
			{
				_list.removeItem(item);
			}
		}
		
		/**
		 * Removes the item from the list at the specified index
		 * @param index The index of the item to remove.
		 */
		public function removeItemAt(index:int):void
		{
			if (_list)
			{
				_list.removeItemAt(index);
			}
		}
		
		/**
		 * Removes all items from the list.
		 */
		public function removeAll():void
		{
			if (_list)
			{
				_list.removeAll();
			}
		}
	
		
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		/**
		 * Called when one of the top buttons is pressed. Either opens or closes the list.
		 */
		protected function onDropDown(event:MouseEvent):void
		{
			_open = !_open;
			
			invalidate();
		}
		
		/**
		 * Called when the mouse is clicked somewhere outside of the combo box when the list is open. Closes the list.
		 */
		protected function onStageClick(event:MouseEvent):void
		{
			// ignore clicks within buttons or list
			if(event.target == _dropDownButton || event.target == _labelButton) return;
			if(new Rectangle(_list.x, _list.y, _list.width, _list.height).contains(event.stageX, event.stageY)) return;
			
			_open = false;
			invalidate();
		}
		
		/**
		 * Called when an item in the list is selected. Displays that item in the label button.
		 */
		protected function onSelect(event:Event):void
		{
			_open = false;
			
			setLabelButtonLabel();
			dispatchEvent(event);
			
			invalidate();
		}
		
		/**
		 * Called when the component is added to the stage.
		 */
		protected function onAddedToStage(event:Event):void
		{
			_stage = stage;
		}
		
		/**
		 * Called when the component is removed from the stage.
		 */
		protected function onRemovedFromStage(event:Event):void
		{
			invalidate();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		/**
		 * Sets / gets the index of the selected list item.
		 */
		public function set selectedIndex(value:int):void
		{
			if (_list)
			{
				_list.selectedIndex = value;
				setLabelButtonLabel();
			}
		}
		public function get selectedIndex():int
		{
			if (_list)
			{
				return _list.selectedIndex;
			}
			else
			{
				return -1;
			}
		}
		
		/**
		 * Sets / gets the item in the list, if it exists.
		 */
		public function set selectedItem(item:Object):void
		{
			if (_list)
			{
				_list.selectedItem = item;
				setLabelButtonLabel();
			}
		}
		public function get selectedItem():Object
		{
			if (_list)
			{
				return _list.selectedItem;
			}
			else
			{
				return null;
			}
		}
		
		/**
		 * Sets/gets the default background color of list items.
		 */
		
		public function set defaultColor(value:uint):void
		{
			_list.defaultColor = value;
		}
		public function get defaultColor():uint
		{
			return _list.defaultColor;
		}
		
		
		/**
		 * Sets/gets the selected background color of list items.
		 */
		
		public function set selectedColor(value:uint):void
		{
			_list.selectedColor = value;
		}
		public function get selectedColor():uint
		{
			return _list.selectedColor;
		}
		
		
		/**
		 * Sets/gets the rollover background color of list items.
		 */
		
		public function set rolloverColor(value:uint):void
		{
			_list.rolloverColor = value;
		}
		public function get rolloverColor():uint
		{
			return _list.rolloverColor;
		}
		
		
		/**
		 * Sets the height of each list item.
		 */
		public function set listItemHeight(value:Number):void
		{
			if (_list)
			{
				_list.listItemHeight = value;
				invalidate();
			}
		}
		public function get listItemHeight():Number
		{
			if (_list)
			{
				return _list.listItemHeight;
			}
			else
			{
				return 0;
			}
		}

		/**
		 * Sets / gets the position the list will open on: top or bottom.
		 */
		public function set openPosition(value:String):void
		{
			_openPosition = value;
		}
		public function get openPosition():String
		{
			return _openPosition;
		}

		/**
		 * Sets / gets the label that will be shown if no item is selected.
		 */
		public function set defaultLabel(value:String):void
		{
			_defaultLabel = value;
			setLabelButtonLabel();
		}
		public function get defaultLabel():String
		{
			return _defaultLabel;
		}

		/**
		 * Sets / gets the number of visible items in the drop down list. i.e. the height of the list.
		 */
		public function set numVisibleItems(value:int):void
		{
			_numVisibleItems = value;
			invalidate();
		}
		public function get numVisibleItems():int
		{
			return _numVisibleItems;
		}

		/**
		 * Sets / gets the list of items to be shown.
		 */
		public function set items(value:Array):void
		{
			if (_list)
			{
				_list.items = value;
			}
			else
			{
				_items = value;
			}
		}
		public function get items():Array
		{
			if (_list)
			{
				return _list.items;
			}
			else
			{
				return null;
			}
		}
		
		/**
		 * Sets / gets the class used to render list items. Must extend ListItem.
		 */
		
		public function set listItemClass(value:Class):void
		{
			if (_list)
			{
				_list.listItemClass = value;
			}
		}
		public function get listItemClass():Class
		{
			if (_list)
			{
				return _list.listItemClass;
			}
			else
			{
				return null;
			}
		}
		
		
		
	}
}