#line 1 "Tweak.xm"
#include "SBFAuthenticationRequest.h"

#define settingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.soup.uzitimepref.plist"]


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBFUserAuthenticationController; @class SBFAuthenticationRequest; 
static void (*_logos_orig$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$)(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST, SEL, id); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBFAuthenticationRequest(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBFAuthenticationRequest"); } return _klass; }
#line 5 "Tweak.xm"

static void _logos_method$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$(_LOGOS_SELF_TYPE_NORMAL SBFUserAuthenticationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];

	bool enabled = [[prefs objectForKey:@"enabled"] boolValue];
	bool trippie = [[prefs objectForKey:@"trippie"] boolValue];
	bool popups = [[prefs objectForKey:@"popups"] boolValue];
	NSString *password = [prefs objectForKey:@"password"];

	if (enabled) {

		SBFAuthenticationRequest *req = arg1;
		NSString *pass = req.passcode; 

		

		if ([pass isEqualToString:@"1600"]) {
			if (popups) {
				UIAlertView *testAlert = [[UIAlertView alloc]initWithTitle:@"Oozifer" message:@"Uzi Time!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
				[testAlert show];
			}

			SBFAuthenticationRequest *newReq = [[_logos_static_class_lookup$SBFAuthenticationRequest() alloc] initForPasscode:password source: req.source handler: req.handler];
			return _logos_orig$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$(self, _cmd, newReq);
		}

		if ([pass isEqualToString:@"1400"]) {
			if (trippie) {
				if (popups) {
					UIAlertView *testAlert = [[UIAlertView alloc]initWithTitle:@"Trippie Time!" message:@"1400" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
					[testAlert show];
				}

				SBFAuthenticationRequest *newReq = [[_logos_static_class_lookup$SBFAuthenticationRequest() alloc] initForPasscode:password source: req.source handler: req.handler];
				return _logos_orig$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$(self, _cmd, newReq);
			}
		}
	}

	_logos_orig$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$(self, _cmd, arg1);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFUserAuthenticationController = objc_getClass("SBFUserAuthenticationController"); MSHookMessageEx(_logos_class$_ungrouped$SBFUserAuthenticationController, @selector(processAuthenticationRequest:), (IMP)&_logos_method$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$, (IMP*)&_logos_orig$_ungrouped$SBFUserAuthenticationController$processAuthenticationRequest$);} }
#line 48 "Tweak.xm"
