//
//  GetSensors.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sensor.h"

static NSString * _Nonnull const kSensorsUrlString = @"http://api.gios.gov.pl/pjp-api/rest/station/sensors";

typedef void (^GetSensorsCallback)(NSDictionary<NSString *, Sensor *> * _Nullable sensors);

@interface GetSensors : NSObject {
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
}

@property(nonatomic, readonly, strong, nonnull) NSDictionary<NSString *, Sensor *> *sensors;

- (void)get:(NSNumber *)stationId completion:(GetSensorsCallback)completionHandler;

@end
