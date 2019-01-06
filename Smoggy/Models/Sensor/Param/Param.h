//
//  Param.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Param : NSObject

@property (nonatomic, readwrite, strong, nullable) NSString *paramName;
@property (nonatomic, readwrite, strong, nullable) NSString *paramFormula;
@property (nonatomic, readwrite, strong, nullable) NSString *paramCode;
@property (nonatomic, readwrite, strong, nullable) NSNumber *idParam;

@end
