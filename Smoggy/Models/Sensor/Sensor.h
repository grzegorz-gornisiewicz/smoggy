//
//  Sensor.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Param.h"

@interface Sensor : NSObject

@property (nonatomic, readwrite, strong, nullable) NSNumber *id;
@property (nonatomic, readwrite, strong, nullable) NSNumber *stationId;
@property (nonatomic, readwrite, strong, nullable, setter=setParam:) Param *param;
@end
