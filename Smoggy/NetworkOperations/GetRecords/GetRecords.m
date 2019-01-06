//
//  GetRecords.m
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import "GetRecords.h"

@interface GetRecords()

@property(nonatomic, readwrite, strong, nonnull) NSMutableDictionary<NSString *, Data *> *records;

@end

@implementation GetRecords

- (instancetype)init {
    self = [super init];
    
    if (self) {
        session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
        self.records = @{}.mutableCopy;
    }

    return self;
}

- (void)get:(NSNumber *)sensorId completion:(GetDataCallback)completionHandler {
    NSURL *baseURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", kDataUrlString, [sensorId stringValue]]];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:NO];
    
    NSLog(@"GetRecords.baseURL:%@", baseURL);
    
    if (dataTask) {
        [dataTask cancel];
    }
    
    dataTask = [session dataTaskWithURL:components.URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSError *error;
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error) {
                completionHandler(nil);
            } else {
                Data *record = [[Data alloc] init];
                
                for (NSString *key in jsonDic) {
                    [record setValue:[jsonDic valueForKey:key] forKey:key];
                }
                
                [self->_records setObject:record forKey:record.key];
                completionHandler(self.records);
            }
        }
    }];
    
    [dataTask resume];
}

@end
