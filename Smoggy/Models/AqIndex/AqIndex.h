//
//  AqIndex.h
//  Smoggy
//
//  Created by Grzegorz Górnisiewicz on 09.07.2018.
//  Copyright © 2018 Grzegorz Górnisiewicz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexLevel.h"

@interface AqIndex : NSObject

@property (nonatomic, readwrite, strong, nullable) NSNumber *id;

/*
 "stCalcDate": "2018-07-09 22:21:58",
 "stIndexLevel": {
 "id": 1,
 "indexLevelName": "Dobry"
 },*/
@property (nonatomic, readwrite, strong, nullable) NSString *stCalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setStIndexLevel:) IndexLevel *stIndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *stSourceDataDate;

/*
"so2CalcDate": "2018-07-09 22:21:58",
"so2IndexLevel": {
    "id": 0,
    "indexLevelName": "Bardzo dobry"
},
"so2SourceDataDate": "2018-07-09 21:00:00",
*/

@property (nonatomic, readwrite, strong, nullable) NSString *so2CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setSo2IndexLevel:) IndexLevel *so2IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *so2SourceDataDate;

/*
 "no2CalcDate": 1531167718000,
 "no2IndexLevel": {
 "id": 0,
 "indexLevelName": "Bardzo dobry"
 },
 "no2SourceDataDate": "2018-07-09 21:00:00",
 */

@property (nonatomic, readwrite, strong, nullable) NSString *no2CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setNo2IndexLevel:) IndexLevel *no2IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *no2SourceDataDate;

/*
 "coCalcDate": "2018-07-09 22:21:58",
 "coIndexLevel": {
 "id": 0,
 "indexLevelName": "Bardzo dobry"
 },
 "coSourceDataDate": "2018-07-09 21:00:00",
 */
@property (nonatomic, readwrite, strong, nullable) NSString *coCalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setCoIndexLevel:) IndexLevel *coIndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *coSourceDataDate;

/*
 "pm10CalcDate": "2018-07-09 22:21:58",
 "pm10IndexLevel": {
 "id": 1,
 "indexLevelName": "Dobry"
 },
 "pm10SourceDataDate": "2018-07-09 20:00:00",
 */
@property (nonatomic, readwrite, strong, nullable) NSString *pm10CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setPm10IndexLevel:) IndexLevel *pm10IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *pm10SourceDataDate;

/*
 "pm25CalcDate": "2018-07-09 22:21:58",
 "pm25IndexLevel": null,
 "pm25SourceDataDate": null,
 */
@property (nonatomic, readwrite, strong, nullable) NSString *pm25CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setPm25IndexLevel:) IndexLevel *pm25IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *pm25SourceDataDate;

/*
"o3CalcDate": "2018-07-09 22:21:58",
"o3IndexLevel": {
    "id": 1,
    "indexLevelName": "Dobry"
},
"o3SourceDataDate": "2018-07-09 21:00:00",
 */
@property (nonatomic, readwrite, strong, nullable) NSString *o3CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setO3IndexLevel:) IndexLevel *o3IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *o3SourceDataDate;

/*
 "c6h6CalcDate": "2018-07-09 22:21:58",
 "c6h6IndexLevel": {
 "id": 0,
 "indexLevelName": "Bardzo dobry"
 },
 "c6h6SourceDataDate": "2018-07-09 21:00:00",
 */

@property (nonatomic, readwrite, strong, nullable) NSString *c6h6CalcDate;
@property (nonatomic, readwrite, strong, nullable, setter=setC6h6IndexLevel:) IndexLevel *c6h6IndexLevel;
@property (nonatomic, readwrite, strong, nullable) NSString *c6h6SourceDataDate;

/*
    "stIndexStatus": true,
    "stIndexCrParam": "OZON"
 */

@property (nonatomic, readwrite, strong, nullable) NSNumber *stIndexStatus;
@property (nonatomic, readwrite, strong, nullable) NSString *stIndexCrParam;

@end
