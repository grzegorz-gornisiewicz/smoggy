//
//  Data.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "Data.h"

@implementation Data

- (void)setValues:(NSArray<Value *> *)values {
    _values = @[].mutableCopy;
    
    for (Value *value in values) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSDictionary *valueDic = (NSDictionary *)value;
            Value *_value = [[Value alloc] init];
            for (NSString *key in valueDic) {
                [_value setValue:[valueDic valueForKey:key] forKey:key];
            }
            [_values addObject:_value];
        } else if ([value isKindOfClass:[Value class]]){
            [_values addObject:value];
        }
    }
}

@end
