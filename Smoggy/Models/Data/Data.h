//
//  Data.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Value.h"

@interface Data : NSObject

@property (nonatomic, readwrite, strong, nullable) NSString *key;
@property (nonatomic, readwrite, strong, nullable, setter=setValues:) NSMutableArray<Value *> *values;

@end
