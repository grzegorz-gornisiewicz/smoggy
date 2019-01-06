//
//  AqIndex.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "AqIndex.h"

@implementation AqIndex

- (void)setCoIndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _coIndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_coIndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _coIndexLevel = indexLevel;
    } else {
        _coIndexLevel = nil;
    }
}

- (void)setO3IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _o3IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_o3IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _o3IndexLevel = indexLevel;
    } else {
        _o3IndexLevel = nil;
    }
}

- (void)setStIndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _stIndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_stIndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _stIndexLevel = indexLevel;
    } else {
        _stIndexLevel = nil;
    }
}

- (void)setNo2IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _no2IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_no2IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _no2IndexLevel = indexLevel;
    } else {
        _no2IndexLevel = nil;
    }
}

- (void)setSo2IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _so2IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_so2IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _so2IndexLevel = indexLevel;
    } else {
        _so2IndexLevel = nil;
    }
}

- (void)setC6h6IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _c6h6IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_c6h6IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _c6h6IndexLevel = indexLevel;
    } else {
        _c6h6IndexLevel = nil;
    }
}

- (void)setPm10IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _pm10IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_pm10IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _pm10IndexLevel = indexLevel;
    } else {
        _pm10IndexLevel = nil;
    }
}

- (void)setPm25IndexLevel:(IndexLevel *)indexLevel {
    if ([indexLevel isKindOfClass:[NSDictionary class]]) {
        NSDictionary *indexLevelDic = (NSDictionary *)indexLevel;
        _pm25IndexLevel = [[IndexLevel alloc] init];
        for (NSString *key in indexLevelDic) {
            [_pm25IndexLevel setValue:[indexLevelDic valueForKey:key] forKey:key];
        }
    } else if ([indexLevel isKindOfClass:[IndexLevel class]]){
        _pm25IndexLevel = indexLevel;
    } else {
        _pm25IndexLevel = nil;
    }
}

@end
