/**
 * LabelSkin.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Default Label skin.
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
	import com.bit101.components.Label;
	import com.bit101.components.Style;
	import com.dgrigg.utils.Logger;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	public class LabelSkin extends Skin
	{
		public var label:TextField;
		
		public function LabelSkin()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			label = new TextField();
			label.name = "label";
			label.height = _height;
			
			label.embedFonts = Style.embedFonts;
			label.selectable = false;
			label.mouseEnabled = false;
			var tf:TextFormat =  new TextFormat(Style.fontName, Style.fontSize, Style.LABEL_TEXT);
			label.defaultTextFormat = tf;
			
			addChild(label);
			
		}
		
		
		override protected function draw():void 
		{
			
			super.draw();
			
			width = hostComponent.width;
			height = hostComponent.height;
			
			var host:Label = hostComponent as Label;
			label.text = host.text;
			
			
		}
	}
}