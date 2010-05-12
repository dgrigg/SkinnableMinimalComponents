/**
 * TextAreaSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default TextArea skin.
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
	import com.bit101.components.Style;
	import com.bit101.components.Text;
	import com.bit101.components.VScrollBar;
	import com.dgrigg.utils.Logger;
	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;


	public class TextAreaSkin extends Skin
	{
		public var panel:Panel;
		public var tf:TextField;
		public var scrollBar:VScrollBar;
		
		
		public function TextAreaSkin()
		{
			super();
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			panel = new Panel(this);
			panel.color = 0xffffff;
			
			tf = new TextField();
			tf.name = "textField";
			tf.x = 2;
			tf.y = 2;
			tf.height = _height;
			tf.embedFonts = Style.embedFonts;
			tf.multiline = true;
			tf.wordWrap = true;
			tf.selectable = true;
			tf.type = TextFieldType.INPUT;
			tf.defaultTextFormat = new TextFormat(Style.fontName, Style.fontSize, Style.LABEL_TEXT);
			addChild(tf);
			
			scrollBar = new VScrollBar();
			scrollBar.name = "scrollBar";
			scrollBar.width = 10;
			addChild(scrollBar);
			
		}
		
		override protected function draw():void 
		{
			super.draw();
			panel.setSize(width, height);
			panel.draw();
			
			tf.width = width - scrollBar.width - 4;
			tf.height = height - 4;
			
			var host:Text = hostComponent as Text;
			
			if(host.html)
			{
				tf.htmlText = host.text;
			}
			else
			{
				tf.text = host.text;
			}
			
			if(host.editable)
			{
				tf.mouseEnabled = true;
				tf.selectable = true;
				tf.type = TextFieldType.INPUT;
			}
			else
			{
				tf.mouseEnabled = host.selectable;
				tf.selectable = host.selectable;
				tf.type = TextFieldType.DYNAMIC;
			}
			
			
			if (scrollBar)
			{
				scrollBar.x = _width - scrollBar.width;
				scrollBar.height = height;
				scrollBar.draw();
			}
			
		}
	}
}