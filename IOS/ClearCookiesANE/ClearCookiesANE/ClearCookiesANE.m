/*
 
 ADOBE SYSTEMS INCORPORATED
 Copyright 2011 Adobe Systems Incorporated
 All Rights Reserved.
 
 NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
 terms of the Adobe license agreement accompanying it.  If you have received this file from a
 source other than Adobe, then your use, modification, or distribution of it requires the prior
 written permission of Adobe.
 
 */

#import "FlashRuntimeExtensions.h"



// VibrateDevice()
//
// This function vibrates the device.

FREObject ClearAll(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    
	// The duration value passed to VibrateDevice() is not used in the iOS implementation.
    
    // AudioServicesPlaySystemSound() vibrates the device.  However,it does nothing if the device does not
    // support vibration.
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    NSArray *allCookies = [storage cookies];
    
    for ( NSHTTPCookie *cookie in allCookies) {
        [storage deleteCookie:cookie];
    }
    
    
	return NULL;
}



// IsSupported()
//
// This function checks whether the device supports vibration.

FREObject IsSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    NSLog(@"Entering IsSupported()");
    
	FREObject fo;
    
    // Always return YES.
    // On some iOS devices,  calling
    // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate) does nothing,
    // However, no way exists to tell from the code.
    
	FRENewObjectFromBool(YES, &fo);
    
	NSLog(@"Exiting IsSupported()");
    
	return fo;
}



// InitNativeCode()
//
// An InitNativeCode function is necessary in the Android implementation of this extension.
// Therefore, an analogous function is necessary in the iOS implementation to make
// the ActionScript interface identical for all implementations.
// However, the iOS implementation has nothing to do.


FREObject InitNativeCode(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    
    NSLog(@"Entering InitNativeCode()");
    
    // Nothing to do.
    
    NSLog(@"Exiting InitNativeCode()");
    
    return NULL;
}



// ContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.

void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
    
    NSLog(@"Entering ContextInitializer()");
    
	*numFunctionsToTest = 3;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 3);
	func[0].name = (const uint8_t*) "isSupported";
	func[0].functionData = NULL;
    func[0].function = &IsSupported;
	
	func[1].name = (const uint8_t*) "clearAll";
	func[1].functionData = NULL;
	func[1].function = &ClearAll;
	
	//Just for consistency with Android
	func[2].name = (const uint8_t*) "initNativeCode";
	func[2].functionData = NULL;
	func[2].function = &InitNativeCode;
	
	*functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
    
}



// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void ContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering ContextFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ContextFinalizer()");
    
	return;
}



// ExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                    FREContextFinalizer* ctxFinalizerToSet) {
    
    NSLog(@"Entering ExtInitializer()");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
    
    NSLog(@"Exiting ExtInitializer()");
}



// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void ExtFinalizer(void* extData) {
    
    NSLog(@"Entering ExtFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ExtFinalizer()");
    return;
}

