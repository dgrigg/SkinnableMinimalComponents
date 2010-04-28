/**
 * GradientStroke.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 0.0.1
 * 
 * A class for creating gradient strokes.
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
	import com.dgrigg.minimalcomps.graphics.GradientItem;
	
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.geom.Matrix;

	[DefaultProperty("colors")]
	public class GradientStroke implements IStroke
	{
		public static const TYPE:String = "";
		protected var _colors:Vector.<GradientItem>;
		protected var _data:String;
		protected var _matrix:Matrix;
		protected var _rotation:Number = 0;
		protected var _width:Number;
		protected var _height:Number;
		
		public var type:String = GradientType.LINEAR;
		public var thickness:Number = 0;
		
		
		protected var gradientColors:Array;
		protected var gradientAlphas:Array;
		protected var gradientRatios:Array;
		
		
		
		public function GradientStroke()
		{
			
		}
		
		public function set width(value:Number):void 
		{
			_width = value;
		}
		
		public function get width():Number 
		{
			return _width;
		}
		
		public function set height(value:Number):void 
		{
			_height = value;
		}
		
		public function get height():Number 
		{
			return _height;
		}
		
		public function set colors(value:Vector.<GradientItem>):void 
		{
			_colors = value;
			
			gradientColors = new Array();
			gradientAlphas = new Array();
			gradientRatios = new Array();
			
			var item:GradientItem;
			for each (item in colors)
			{
				gradientColors.push(item.color);
				gradientAlphas.push(item.alpha);
				gradientRatios.push(item.ratio);
			}
			
		}
		
		public function get colors():Vector.<GradientItem>
		{
			return _colors;
		}
		
		public function set matrix(value:Matrix):void 
		{
			_matrix = value;
		}
		
		public function get matrix():Matrix 
		{
			return _matrix;
		}
		
		/**
		 * gradient rotation in degress
		 */
		public function set rotation(value:Number):void 
		{
			_rotation = value;
		}
		
		public function get rotation():Number 
		{
			return _rotation
		}
		
		public function set data(value:String):void 
		{
			_data = value;
		}
		
		public function get data():String 
		{
			return _data;
		}
		
		
		
		public function draw(graphics:Graphics):void
		{
			var item:GradientItem;
			
			if (!_matrix)
			{
				_matrix = new Matrix();
			}
			
			//convert rotation to radians
			var r:Number = _rotation * (Math.PI/180);
			_matrix.createGradientBox(_width, _height, r);
			
			graphics.lineStyle(thickness);
			graphics.lineGradientStyle(type, gradientColors, gradientAlphas, gradientRatios, _matrix);
		}
		
		public function endDraw(graphics:Graphics):void 
		{
			graphics.endFill();
		}
	}
}