/**
 * Logger.as
 * Derrick Grigg
 * www.dgrigg.com
 * version 1.0.0
 *
 * Utility class to output trace and logging statements.
 * 
 * Copyright (c) 2009 Derrick Grigg
 * 
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */


package com.dgrigg.utils
{
	import flash.external.ExternalInterface;
	
	public class Logger
	{
		public function Logger()
		{
		}
		
		public static function log(value:Object):void 
		{
			try
			{
				if (ExternalInterface.available)
				{
					ExternalInterface.call("console.log", value.toString());
				}
				else
				{
					trace(value.toString());
				}
			}
			catch (err:Error)
			{
				
			}
			
		}

	}
}