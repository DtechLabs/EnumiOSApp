//
//  LMWorkspace.m
//  AppTipTop
//
//  Created by Yuri Drigin on 14.10.16.
//  Copyright © 2016 Yuri Drigin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMWorkspace.h"

@interface PrivateApi_LSApplicationWorkspace
    - (NSArray*)allInstalledApplications;
    - (bool)openApplicationWithBundleID:(id)arg1;
@end

@implementation LMWorkspace {
    
    PrivateApi_LSApplicationWorkspace* _workspace;
    NSArray* _installedApplications;
}

- (instancetype)init
{
    self = [super init];
    if(self != nil)
    {
        _workspace = [NSClassFromString(@"LSApplicationWorkspace") new];
    }
    
    return self;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (BOOL)openAppWithBundleIdentifier:(NSString *)bundleIdentifier
{
    return (BOOL)[_workspace openApplicationWithBundleID:bundleIdentifier];
}


- (NSArray*)readApplications
{
    NSArray* allInstalledApplications = [_workspace allInstalledApplications];
    NSMutableArray* applications = [NSMutableArray arrayWithCapacity:allInstalledApplications.count];
    for(id proxy in allInstalledApplications)
    {
        LMApp* app = [LMApp appWithPrivateProxy:proxy];
        if(!app.isHiddenApp)
        {
            [applications addObject:app];
        }
    }
    
    return applications;
}

- (NSArray*)installedApplications
{
    if(nil == _installedApplications)
    {
        _installedApplications = [self readApplications];
    }
    
    return _installedApplications;
}

@end
