#if !__has_include(<PassKitUI/PKIssuerProvisioningExtensionAuthorizationProviding.h>) || PK_USE_PUBLIC_PASSKIT
//
//  PKIssuerProvisioningExtensionAuthorizationProviding.h
//    PassKit
//
//  Copyright © 2020 Apple, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PKIssuerProvisioningExtensionAuthorizationResult) {
    PKIssuerProvisioningExtensionAuthorizationResultCanceled,
    PKIssuerProvisioningExtensionAuthorizationResultAuthorized
} API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos, tvos, macos);

API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(watchos, tvos, macos)
@protocol PKIssuerProvisioningExtensionAuthorizationProviding <NSObject>

@property (nonatomic, copy, nullable) void(^completionHandler)(PKIssuerProvisioningExtensionAuthorizationResult result);

@end

NS_ASSUME_NONNULL_END

#else
#if !TARGET_OS_OSX 
#import <TargetConditionals.h>
#import <PassKitUI/PKIssuerProvisioningExtensionAuthorizationProviding.h>
#endif
#endif
