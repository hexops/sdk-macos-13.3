// Copyright © 2020 Apple Inc. All rights reserved.

#import <AuthenticationServices/ASAuthorizationPublicKeyCredentialRegistrationRequest.h>
#import <AuthenticationServices/ASAuthorizationRequest.h>
#import <Foundation/Foundation.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

API_AVAILABLE(macos(12.0), ios(15.0)) API_UNAVAILABLE(watchos, tvos)
@interface ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest : ASAuthorizationRequest <ASAuthorizationPublicKeyCredentialRegistrationRequest>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_HEADER_AUDIT_END(nullability, sendability)
