package com.bit101.components
{
	import flash.display.DisplayObjectContainer;
	import com.dgrigg.minimalcomps.skins.HScrollSliderSkin;
	
	public class HScrollSlider extends ScrollSlider
	{
		public function HScrollSlider(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0)
		{
			skinClass = com.dgrigg.minimalcomps.skins.HScrollSliderSkin;
			super(Slider.HORIZONTAL, parent, xpos, ypos);
		}
	}
}