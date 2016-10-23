//
//  LMApp.h
//  WatchSpringboard
//
//  Created by Andreas Verhoeven on 28-10-14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMApp : NSObject

@property (nonatomic, readonly) NSString* bundleIdentifier;
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) UIImage* icon;

@property (nonatomic, readonly) BOOL isHiddenApp;
@property (nonatomic, readonly) NSString* applicationType;
@property (nonatomic, readonly) NSString *applicationDSID;
@property (nonatomic, readonly) NSString *applicationIdentifier;
@property (nonatomic, readonly) NSString *itemName;
@property (nonatomic, readonly) NSNumber *purchaserDSID;
@property (nonatomic, readonly) NSNumber *ratingRank;
@property (nonatomic, readonly) unsigned int originalInstallType;
@property (nonatomic, readonly) NSDate *registeredDate;
@property (nonatomic, readonly) NSString *vendorName;
@property (nonatomic, readonly) NSString *shortLocalName;

- (NSUUID*) uniqueIdentifier;
- (id) description;

+ (instancetype)appWithPrivateProxy:(id)privateProxy;
+ (instancetype)appWithBundleIdentifier:(NSString*)bundleIdentifier;

@end
