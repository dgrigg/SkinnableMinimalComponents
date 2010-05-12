package com.bit101.components
{
	import flash.display.DisplayObjectContainer;
	import com.dgrigg.minimalcomps.skins.VScrollSliderSkin;
	
	public class VScrollSlider extends ScrollSlider
	{
		public function VScrollSlider(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function = null)
		{
			skinClass = com.dgrigg.minimalcomps.skins.VScrollSliderSkin;
			super(Slider.VERTICAL, parent, xpos, ypos, defaultHandler);
		}
	}
}