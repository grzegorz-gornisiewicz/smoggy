//
//  City.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Commune.h"

@interface City : NSObject

@property (nonatomic, readwrite) NSNumber *id;
@property (nonatomic, readwrite, strong, nullable) NSString *name;
@property (nonatomic, readwrite, strong, nullable, setter=setCommune:) Commune *commune;

@end
