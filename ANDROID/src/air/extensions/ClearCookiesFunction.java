/*ADOBE SYSTEMS INCORPORATED
Copyright 2011 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:� Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.� If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
 */

package air.extensions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

// Class VibrationVibrateFunction
//
// This class makes the device vibrate.
//
// The passedArgs array in call() contains one argument: the duration in milliseconds to vibrate the device.

public class ClearCookiesFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] passedArgs) {

		FREObject result = null;

		android.webkit.CookieManager.getInstance().removeAllCookie();

		return result;
	}
}
