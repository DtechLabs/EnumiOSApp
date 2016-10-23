//
//  LMApp.m
//  WatchSpringboard
//
//  Created by Andreas Verhoeven on 28-10-14.
//  Copyright (c) 2014 Lucas Menge. All rights reserved.
//

#import "LMApp.h"

@interface UIImage ()
+ (id)_iconForResourceProxy:(id)arg1 variant:(int)arg2 variantsScale:(float)arg3;
+ (id)_applicationIconImageForBundleIdentifier:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end

#pragma mark -

@interface PrivateApi_LSApplicationProxy

+ (instancetype)applicationProxyForIdentifier:(NSString*)identifier;
@property (nonatomic, readonly) NSString* localizedShortName;
@property (nonatomic, readonly) NSString* localizedName;
@property (nonatomic, readonly) NSString* bundleIdentifier;
@property (nonatomic, readonly) NSArray* appTags;
@property (nonatomic, readonly) NSString *applicationType;
@property (nonatomic, readonly) NSString *applicationDSID;
@property (nonatomic, readonly) NSString *applicationIdentifier;
@property (nonatomic, readonly) NSString *itemName;
@property (nonatomic, readonly) NSNumber *purchaserDSID;
@property (nonatomic, readonly) NSNumber *ratingRank;
@property (nonatomic, readonly) unsigned int originalInstallType;
@property (nonatomic, readonly) NSDate *registeredDate;
@property (nonatomic, readonly) NSString *vendorName;

- (id)uniqueIdentifier;
- (id)description;

@end

#pragma mark -

@implementation LMApp
{
	PrivateApi_LSApplicationProxy* _applicationProxy;
	UIImage* _icon;
}

-(NSString*) shortLocalName
{
    return _applicationProxy.localizedShortName;
}

- (id)uniqueIdentifier {
    return _applicationProxy.uniqueIdentifier;
}

- (id)description {
    return _applicationProxy.description;
}

-(NSString*) applicationDSID
{
    return _applicationProxy.applicationDSID;
}

-(NSString*) applicationIdentifier
{
    return _applicationProxy.applicationIdentifier;
}

-(NSString*) itemName
{
    return _applicationProxy.itemName;
}

-(NSNumber*) purchaserDSID
{
    return _applicationProxy.purchaserDSID;
}

-(NSNumber*) ratingRank;
{
    return _applicationProxy.ratingRank;;
}

-(unsigned int) originalInstallType
{
    return _applicationProxy.originalInstallType;
}

-(NSDate*) registeredDate
{
    return _applicationProxy.registeredDate;
}

-(NSString*) vendorName
{
    return _applicationProxy.vendorName;
}

- (NSString*)name
{
	return _applicationProxy.localizedName ?: _applicationProxy.localizedShortName;
}

- (NSString*)bundleIdentifier
{
	return [_applicationProxy bundleIdentifier];
}

- (UIImage*)icon
{
	if(nil == _icon)
	{
		_icon = [UIImage _applicationIconImageForBundleIdentifier:self.bundleIdentifier format:10 scale:2.0];
	}
	
	return _icon;
}

-(NSString*) applicationType
{
    return _applicationProxy.applicationType;
}

- (BOOL)isHiddenApp
{
	return [[_applicationProxy appTags] indexOfObject:@"hidden"] != NSNotFound;
}

- (id)initWithPrivateProxy:(id)privateProxy
{
  self = [super init];
  if(self != nil)
  {
    _applicationProxy = (PrivateApi_LSApplicationProxy*)privateProxy;
  }
  
  return self;
}

- (instancetype)initWithBundleIdentifier:(NSString*)bundleIdentifier
{
  self = [super init];
  if(self != nil)
  {
    _applicationProxy = [NSClassFromString(@"LSApplicationProxy") applicationProxyForIdentifier:bundleIdentifier];
  }
  
  return self;
}

+ (instancetype)appWithPrivateProxy:(id)privateProxy
{
  return [[self alloc] initWithPrivateProxy:privateProxy];
}

+ (instancetype)appWithBundleIdentifier:(NSString*)bundleIdentifier
{
  return [[self alloc] initWithBundleIdentifier:bundleIdentifier];
}

@end
