/*ADOBE SYSTEMS INCORPORATED
Copyright 2011 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:� Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.� If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
 */

package air.extensions;

import java.util.HashMap;
import java.util.Map;

import android.os.Vibrator;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

// Class VibrationExtensionContext.
//

public class ClearCookiesExtensionContext extends FREContext{

	public ClearCookiesExtensionContext()
	{
	}

	// dispose()
	// Cleans up resources associated with the extension context.
	//
	@Override
	public void dispose()
	{
	}

	// getFunctions()
	// Maps the string value used in ActionScript to a native FREFunction reference.
	//
	@Override
	public Map<String,FREFunction> getFunctions()
	{

		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

		functionMap.put("isSupported", new ClearCookiesSupportedFunction());
		functionMap.put("clearAll", new ClearCookiesFunction());
		functionMap.put("initNativeCode", new ClearCookiesInitNativeCodeFunction());


		return functionMap;
	}

}
