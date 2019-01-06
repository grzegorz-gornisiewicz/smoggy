//
//  GetStations.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "GetStations.h"

@interface GetStations()

@property(nonatomic, readwrite, strong, nonnull) NSMutableDictionary<NSString *, Station *> *stations;

@end

@implementation GetStations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
        self.stations = @{}.mutableCopy;
    }

    return self;
}

- (void)get:(GetStationsCallback)completionHandler {
    NSURL *baseURL = [[NSURL alloc] initWithString:kStationsUrlString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:NO];

    if (dataTask) {
        [dataTask cancel];
    }
    
    dataTask = [session dataTaskWithURL:components.URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSError *error;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error) {
                completionHandler(nil);
            } else {
                 for (NSDictionary *jsonDic in jsonArray) {
                    Station *station = [[Station alloc] init];

                    for (NSString *key in jsonDic) {
                        [station setValue:[jsonDic valueForKey:key] forKey:key];
                    }

                    [self->_stations setObject:station forKey:station.id];
                }
                
                completionHandler(self.stations);
            }
        }
    }];
    
    [dataTask resume];
}

@end
