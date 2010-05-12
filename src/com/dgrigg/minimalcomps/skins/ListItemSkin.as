/**
 * ListItemSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default ListItemSkin skin.
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
	import com.bit101.components.Label;
	import com.bit101.components.ListItem;
	import com.dgrigg.minimalcomps.graphics.Rect;
	import com.dgrigg.minimalcomps.graphics.SolidFill;
	import com.dgrigg.utils.Logger;

	public class ListItemSkin extends Skin
	{
		public var label:Label;
		public var back:Rect;
		
		protected var _defaultColor:uint = 0xffffff;
		protected var _selectedColor:uint = 0xdddddd;
		protected var _rolloverColor:uint = 0xeeeeee;
		
		public function ListItemSkin()
		{
			super();
		}
		
		override protected function createChildren():void 
		{
			back = new Rect();
			var fill:SolidFill = new SolidFill();
			back.fill = fill;
			addChild(back);
			
			label = new Label();
			label.name = "label";
			addChild(label);
			
		}
		
		override protected function draw():void 
		{
			super.draw();
			var host:ListItem = hostComponent as ListItem;
			
			if (label)
			{
				label.x = 5;
				
				if(host.data is String)
				{
					label.text = host.data as String;
				}
				else if(host.data.label is String)
				{
					label.text = host.data.label;
				}
				else
				{
					label.text = host.data.toString();
				}
			}
			
			if (back)
			{
				back.height = height;
				back.width = width;
				var fill:SolidFill = back.fill as SolidFill;
				
				if (currentState == "selected")
				{
					fill.color = _selectedColor;
				}
				else if (currentState == "over")
				{
					fill.color = _rolloverColor;
				}
				else 
				{
					fill.color = _defaultColor;
				}
				
				back.validate();
				
			}
			
			
		}
	}
}