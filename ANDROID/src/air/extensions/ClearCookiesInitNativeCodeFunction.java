/*ADOBE SYSTEMS INCORPORATED
Copyright 2011 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
terms of the Adobe license agreement accompanying it.  If you have received this file from a 
source other than Adobe, then your use, modification, or distribution of it requires the prior 
written permission of Adobe.
 */

package air.extensions;

import android.app.Activity;
import android.content.Context;
import android.os.Vibrator;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

// Class VibrationInitNativeCodeFunction
//
// This class performs initializations that the native code requires but which
// cannot be done until after the ActionScript call to
// ExtensionContext.createExtensionContext() has returned.
//
// Specifically, you cannot access the methods of the object derived from FREContext
// until then. For example, you cannot call the FREContext object's
// getActivity() method in the constructor of the FREContext object.
//

public class ClearCookiesInitNativeCodeFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] passedArgs) {
		return null;
	}

}
