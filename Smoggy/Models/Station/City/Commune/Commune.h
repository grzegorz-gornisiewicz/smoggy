//
//  Commune.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commune : NSObject

@property (nonatomic, readwrite, strong, nullable) NSString *communeName;
@property (nonatomic, readwrite, strong, nullable) NSString *districtName;
@property (nonatomic, readwrite, strong, nullable) NSString *provinceName;

@end
