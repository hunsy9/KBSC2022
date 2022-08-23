#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BootpayApiPlugin.h"

FOUNDATION_EXPORT double bootpay_apiVersionNumber;
FOUNDATION_EXPORT const unsigned char bootpay_apiVersionString[];

