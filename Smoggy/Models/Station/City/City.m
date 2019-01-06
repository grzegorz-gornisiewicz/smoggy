//
//  City.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "City.h"

@implementation City

- (void)setCommune:(Commune *)commune {
    if ([commune isKindOfClass:[NSDictionary class]]) {
        NSDictionary *communeDic = (NSDictionary *)commune;
        _commune = [[Commune alloc] init];
        for (NSString *key in communeDic) {
            [_commune setValue:[communeDic valueForKey:key] forKey:key];
        }
    } else if ([commune isKindOfClass:[Commune class]]){
        _commune = commune;
    } else {
        _commune = nil;
    }
}

@end
