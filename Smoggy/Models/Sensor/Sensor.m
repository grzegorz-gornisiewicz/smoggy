//
//  Sensor.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "Sensor.h"

@implementation Sensor

- (void)setParam:(Param *)param {
    if ([param isKindOfClass:[NSDictionary class]]) {
        NSDictionary *paramDic = (NSDictionary *)param;
        _param = [[Param alloc] init];
        for (NSString *key in paramDic) {
            [_param setValue:[paramDic valueForKey:key] forKey:key];
        }
    } else if ([param isKindOfClass:[Param class]]){
        _param = param;
    } else {
        _param = nil;
    }
}

@end
