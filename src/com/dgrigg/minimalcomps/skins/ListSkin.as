/**
 * ListSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default ListSkin skin.
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
	import com.bit101.components.Panel;
	import com.bit101.components.ScrollBar;
	import com.bit101.components.VScrollBar;

	public class ListSkin extends Skin
	{
		public var scrollBar:ScrollBar;
		public var panel:Panel;
		
		public function ListSkin()
		{
			super();
		}
		
		override protected function createChildren():void 
		{
			
			
			panel = new Panel();
			panel.name = "panel";
			panel.color = 0xFFFFFF;
			addChild(panel);
			
			scrollBar = new VScrollBar();
			scrollBar.name = "scrollBar";
			addChild(scrollBar);
			
		}
		
		override protected function draw():void 
		{
			super.draw();
			
			if (panel)
			{
				panel.setSize(_width, _height);
				panel.draw();
			}
			
			if (scrollBar)
			{
				scrollBar.x = _width - 10;
				
				scrollBar.height = _height;
				scrollBar.draw();
			}
		}
	}
}