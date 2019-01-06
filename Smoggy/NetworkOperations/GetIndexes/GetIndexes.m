//
//  GetIndexes.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "GetIndexes.h"

@interface GetIndexes()

@property(nonatomic, readwrite, strong, nonnull) NSMutableDictionary<NSString *, AqIndex *> *indexes;

@end

@implementation GetIndexes

- (instancetype)init {
    self = [super init];
    
    if (self) {
        session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
        self.indexes = @{}.mutableCopy;
    }

    return self;
}

- (void)get:(NSNumber *)stationId completion:(GetAqIndexCallback)completionHandler {
    NSURL *baseURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", kAqIndexUrlString, [stationId stringValue]]];
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
                    AqIndex *index = [[AqIndex alloc] init];
                    
                    for (NSString *key in jsonDic) {
                        [index setValue:[jsonDic valueForKey:key] forKey:key];
                    }
                    
                    [self->_indexes setObject:index forKey:index.id];
                }

                completionHandler(self.indexes);
            }
        }
    }];

    [dataTask resume];
}

@end
