//
//  GetStations.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Station.h"

static NSString * _Nonnull const kStationsUrlString = @"http://api.gios.gov.pl/pjp-api/rest/station/findAll";

typedef void (^GetStationsCallback)(NSDictionary<NSString *, Station *> * _Nullable stations);

@interface GetStations : NSObject {
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
}

@property(nonatomic, readonly, strong, nonnull) NSDictionary<NSString *, Station *> *stations;

- (void)get:(GetStationsCallback)completionHandler;

@end
