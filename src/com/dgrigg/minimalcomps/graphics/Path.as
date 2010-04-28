/**
 * Path.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * Defines a path to drawing using the drawing api.
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

package com.dgrigg.minimalcomps.graphics
{
	
	
	import com.dgrigg.minimalcomps.graphics.IGraphic;
	import com.dgrigg.minimalcomps.graphics.Shape;
	import com.dgrigg.utils.Logger;
	
	import flash.display.Graphics;
	
	
	public class Path extends Shape implements IGraphic
	{
		
		
		protected var commands:Vector.<IGeometry>;
		
		public function Path(value:String = null)
		{
			data = value;
		}
		
		/**
		 * The following command can be used to create a drawing path, values must be space delimited
		 * M x y - move to x y
		 * L x y - line to x y
		 * C cx1 cy1 cx2 cy2 x1 y1 x y - draw a cubic bezier to x y through control point cx1/cy1 and cx2/cy2
		 * Q cx1 cy1 x y - draw a quadratic bezier to x y through control point cx1/cy1
		 */
		override public function set data(value:String):void 
		{
			if (value)
			{
				
				//split the commands up and delimit with commas
				_data = value.replace(/(\s[CLMQclmq])/gi, ',$1');
				
				commands = new Vector.<IGeometry>;
				
				var list:Array = _data.split(",");
				var prevCommand:Geometry;
				var command:Geometry;
				
				var len:int = list.length;
				var c:String;
				var cValue:String;
				
				//trim expression
				var regex:RegExp = /^(\s*)([\W\w]*)(\b\s*$)/;
				
				//command expression
				var cRegex:RegExp = /[CLMQclmq]\s{0,}/;
				
				
				for (var i:int=0;i<len;i++)
				{
					cValue = String(list[i]).replace(regex, "$2");
					c = cValue.substr(0,1);
					//strip out the letter
					cValue = cValue.replace(cRegex, "");
					
					 
					switch (c)
					{
						case "L":
							command = new Line();
							break;
						case "M":
							command = new Move();
							break;
						case "Q":
							command = new QuadraticBezier();
							break;
						case "C":
							if (prevCommand)
							{
								cValue = prevCommand.x + " "+  prevCommand.y + " " + cValue;
							}
							else 
							{
								cValue = "0 0 " + cValue;
							}
							command = new CubicBezier();
							break;
						default:
							command = null
							break;
					}
					
					if (command)
					{
						command.data = cValue;
						prevCommand = command;
						commands.push(command);
						
					}
					
					
				}
			}
		}
		
		
		
		override protected function draw():void
		{
			super.draw();
			
			var command:IGeometry;
			
			for each(command in commands)
			{
				command.draw(graphics);
			}
			
			
		}
		
		
		
	}
	
	
}