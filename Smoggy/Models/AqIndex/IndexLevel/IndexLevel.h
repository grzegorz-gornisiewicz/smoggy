//
//  IndexLevel.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "stIndexLevel": {
 "id": 1,
 "indexLevelName": "Dobry"
 },
 */
@interface IndexLevel : NSObject

@property (nonatomic, readwrite, strong, nullable) NSNumber *id;
@property (nonatomic, readwrite, strong, nullable) NSString *indexLevelName;

@end
