//
//  GetRecords.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"

static NSString * _Nonnull const kDataUrlString = @"http://api.gios.gov.pl/pjp-api/rest/data/getData";

typedef void (^GetDataCallback)(NSDictionary<NSString *, Data *> * _Nullable records);

@interface GetRecords : NSObject {
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
}

@property(nonatomic, readonly, strong, nonnull) NSDictionary<NSString *, Data *> *records;

- (void)get:(NSNumber *)sensorId completion:(GetDataCallback)completionHandler;

@end
