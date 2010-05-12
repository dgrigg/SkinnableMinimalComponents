/**
 * Skin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Base class for creating skins.
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

package com.dgrigg.minimalcomps.skins
{
	import com.bit101.components.Component;
	import com.bit101.components.Style;
	import com.dgrigg.minimalcomps.events.SkinPartEvent;
	import com.dgrigg.minimalcomps.graphics.IGraphic;
	import com.dgrigg.utils.Logger;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	
	[DefaultProperty("children")]
	public class Skin extends Sprite implements ISkin
	{
		/* component associated to skin */
		private var _hostComponent:Component;
		
		protected var _children:Vector.<DisplayObject>;
		
		protected var _skinElements:Vector.<IGraphic>;
		
		protected var _height:Number;
		protected var _width:Number;
		protected var _currentState:String;
		
		public function Skin()
		{
			super();
			
			
			_skinElements = new Vector.<IGraphic>;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved, false, 0, true);
			
		}
		
		protected function createChildren():void 
		{
			
		}
		
		
		
		protected function onAdded(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded, false);
			createChildren();
		}
		
		protected function onRemoved(event:Event):void 
		{
			
			
		}
		
		public function set hostComponent(value:Component):void 
		{
			_hostComponent = value;
		}
		
		public function get hostComponent():Component 
		{
			return _hostComponent;
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
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			var c:DisplayObject = super.addChild(child);
			
			if (child is IGraphic)
			{
				_skinElements.push(child);
				
			}
			
			var e:SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_ADDED);
			e.name = child.name;
			e.instance = child;
			dispatchEvent(e);
			
			invalidate();
			
			return c;
			
		}
		
		
		public function set children(value:Vector.<DisplayObject>):void 
		{
			if (value != _children)
			{
				while (numChildren > 0)
				{
					removeChildAt(0);
				}
				
				_children = value;
				_skinElements = new Vector.<IGraphic>;
				
				var child:DisplayObject
				for each (child in _children)
				{
					addChild(child);
					
					
				}	
			}
		}
		
		public function get children():Vector.<DisplayObject> 
		{
			return _children;
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
			width = hostComponent.width;
			height = hostComponent.height;
			
			var item:IGraphic;
			
			for each (item in _skinElements)
			{
				item.validate();
			}
			
			
		}
		
		/**
		 * Get's the current state of the component. Default is empty String. 
		 * @return 
		 * 
		 */		
		public function get currentState():String 
		{ 
			return _currentState; 
		}
		
		/**
		 * Set's the current state of the component.  If value changes, onExitState is called, and then onEnterState. 
		 * @param value
		 * 
		 */		
		public function set currentState(value:String):void
		{
			if(_currentState == value)
			{
				return;
			}
			else
			{
				_currentState = value;
				invalidate();
			}
		}
		
		/**
		 * DropShadowFilter factory method, used in many of the components.
		 * @param dist The distance of the shadow.
		 * @param knockout Whether or not to create a knocked out shadow.
		 */
		protected function getShadow(dist:Number, knockout:Boolean = false):DropShadowFilter
		{
			return new DropShadowFilter(dist, 45, Style.DROPSHADOW, 1, dist, dist, .3, 1, knockout);
		}
		
		
		
	}
}