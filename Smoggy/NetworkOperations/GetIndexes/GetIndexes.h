//
//  GetIndexes.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AqIndex.h"

static NSString * _Nonnull const kAqIndexUrlString = @"http://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex";

typedef void (^GetAqIndexCallback)(NSDictionary<NSString *, AqIndex *> * _Nullable indexes);

@interface GetIndexes : NSObject {
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
}

@property(nonatomic, readonly, strong, nonnull) NSDictionary<NSString *, AqIndex *> *indexes;

- (void)get:(NSNumber *)stationId completion:(GetAqIndexCallback)completionHandler;

@end
