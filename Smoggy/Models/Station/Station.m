//
//  Station.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "Station.h"

@implementation Station

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _visibleOnMap = YES;
    }

    return self;
}

- (void)setCity:(City *)city {
    if ([city isKindOfClass:[NSDictionary class]]) {
        NSDictionary *cityDic = (NSDictionary *)city;
        _city = [[City alloc] init];
        for (NSString *key in cityDic) {
            [_city setValue:[cityDic valueForKey:key] forKey:key];
        }
    } else if ([city isKindOfClass:[City class]]){
        _city = city;
    } else {
        _city = nil;
    }
}

@end
