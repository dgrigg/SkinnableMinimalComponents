/**
 * ComboBoxSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default ComboBoxSkin skin.
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
	import com.bit101.components.ComboBox;
	import com.bit101.components.List;
	import com.bit101.components.PushButton;
	
	import com.dgrigg.utils.Logger;
	
	public class ComboBoxSkin extends Skin
	{
		public var list:List;
		public var labelButton:PushButton;
		public var dropDownButton:PushButton;
		
		public function ComboBoxSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			list = new List();
			list.name = "list";
			addChild(list);
			
			labelButton = new PushButton();
			labelButton.name = "labelButton";
			addChild(labelButton);
			
			dropDownButton = new PushButton();
			dropDownButton.name = "dropDownButton";
			addChild(dropDownButton);
			
		}
		
		override protected function draw():void 
		{
			super.draw();
			
			labelButton.setSize(width - height + 1, height);
			labelButton.draw();
			
			if (currentState == "open")
			{
				dropDownButton.label = "-";
			}
			else
			{
				dropDownButton.label = "+";
			}
			
			dropDownButton.setSize(height, height);
			dropDownButton.draw();
			dropDownButton.x = width - height;
			
			var host:ComboBox = hostComponent as ComboBox;
			list.setSize(width, host.numVisibleItems * host.listItemHeight);
			list.draw();
			
		}
	}
}