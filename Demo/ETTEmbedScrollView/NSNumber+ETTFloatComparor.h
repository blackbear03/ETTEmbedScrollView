//
//  NSNumber+ETTFloatComparor.h
//  Demo
//
//  Created by elliot on 2018/6/11.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, ETTFloatComparorResult) {
    ETTFloatComparorResultEqual,
    ETTFloatComparorResultGreater,
    ETTFloatComparorResultLess
};

@interface NSNumber (ETTFloatComparor)

- (ETTFloatComparorResult)ett_compareWithFloatNumber:(NSNumber *)floatNumber;
- (BOOL)ett_isEqualToFloatNumber:(NSNumber *)floatNumber;
- (BOOL)ett_isGreaterThanFloatNumber:(NSNumber *)floatNumber;
- (BOOL)ett_isLessThanFloatNumber:(NSNumber *)floatNumber;
- (BOOL)ett_isGreaterOrEqualToFloatNumber:(NSNumber *)floatNumber;
- (BOOL)ett_isLessOrEqualToFloatNumber:(NSNumber *)floatNumber;

@end
