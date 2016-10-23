//
//  LMWorkspace.h
//  AppTipTop
//
//  Created by Yuri Drigin on 14.10.16.
//  Copyright © 2016 Yuri Drigin. All rights reserved.
//

#ifndef LMWorkspace_h
#define LMWorkspace_h

#import <Foundation/Foundation.h>
#import "LMApp.h"

@interface LMWorkspace : NSObject

@property (nonatomic, readonly) NSArray* installedApplications;


- (BOOL)openAppWithBundleIdentifier:(NSString*)bundleIdentifier;

+ (instancetype)sharedInstance;

@end

#endif /* LMWorkspace_h */
