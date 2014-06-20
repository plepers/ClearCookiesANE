package com.mmp
{
	import flash.external.ExtensionContext;

	public class ClearCookies
	{
		private static var extContext:ExtensionContext = null;

		private static function getExtension():ExtensionContext
		{
			if (!extContext)
			{	
				extContext = ExtensionContext.createExtensionContext("com.mmp.ClearCookiesANE", null);
				extContext.call("initNativeCode");
			}
			return extContext;
		}
		
		public static function get isSupported():Boolean
		{
			return getExtension().call("isSupported") as Boolean;
		}
		
		
		public static function clearAll():void
		{
			getExtension().call("clearAll");
		}
	}
}