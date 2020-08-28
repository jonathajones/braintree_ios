//
//  PPOTCheckoutAppSwitchRequest.m
//  PayPalOneTouch
//
//  Copyright © 2015 PayPal, Inc. All rights reserved.
//

#import "PPOTCheckoutAppSwitchRequest.h"

#import <PayPalUtils/PayPalUtils.h>

@implementation PPOTCheckoutAppSwitchRequest

- (NSDictionary *)payloadDictionary {

    NSMutableDictionary *payload = [[super payloadDictionary] mutableCopy];

    payload[kPPOTAppSwitchAppGuidKey] = self.appGuid;
    payload[kPPOTAppSwitchWebURLKey] = self.approvalURL;

    return payload;
}

@end
