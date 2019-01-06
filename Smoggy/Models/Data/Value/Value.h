//
//  Value.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Value : NSObject

@property (nonatomic, readwrite, strong, nullable) NSString *date;
@property (nonatomic, readwrite, strong, nullable) NSNumber *value;

@end
