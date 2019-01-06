//
//  Station.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface Station : NSObject

@property (nonatomic, readwrite, strong, nullable) NSNumber *id;
@property (nonatomic, readwrite, strong, nullable) NSString *stationName;
@property (nonatomic, readwrite, strong, nullable) NSNumber *gegrLat;
@property (nonatomic, readwrite, strong, nullable) NSNumber *gegrLon;
@property (nonatomic, readwrite, strong, nullable, setter=setCity:) City *city;
@property (nonatomic, readwrite, strong, nullable) NSString *addressStreet;

@property (nonatomic, readwrite) BOOL visibleOnMap;

@end
