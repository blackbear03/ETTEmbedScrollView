//
//  NSNumber+ETTFloatComparor.m
//  Demo
//
//  Created by elliot on 2018/6/11.
//  Copyright © 2018年 elliot. All rights reserved.
//

#import "NSNumber+ETTFloatComparor.h"

@implementation NSNumber (ETTFloatComparor)

- (ETTFloatComparorResult)ett_compareWithFloatNumber:(NSNumber *)floatNumber {
    float selfFloatValue = [self floatValue];
    float comparedFloatValue = [floatNumber floatValue];
    if(fabs(selfFloatValue - comparedFloatValue) < DBL_EPSILON) {
        return ETTFloatComparorResultEqual;
    } else {
        return selfFloatValue > comparedFloatValue ? ETTFloatComparorResultGreater : ETTFloatComparorResultLess;
    }
}

- (BOOL)ett_isEqualToFloatNumber:(NSNumber *)floatNumber {
    return [self ett_compareWithFloatNumber:floatNumber] == ETTFloatComparorResultEqual;
}

- (BOOL)ett_isGreaterThanFloatNumber:(NSNumber *)floatNumber {
    return [self ett_compareWithFloatNumber:floatNumber] == ETTFloatComparorResultGreater;
}

- (BOOL)ett_isLessThanFloatNumber:(NSNumber *)floatNumber {
    return [self ett_compareWithFloatNumber:floatNumber] == ETTFloatComparorResultLess;
}

- (BOOL)ett_isGreaterOrEqualToFloatNumber:(NSNumber *)floatNumber {
    return [self ett_isGreaterThanFloatNumber:floatNumber] || [self ett_isEqualToFloatNumber:floatNumber];
}

- (BOOL)ett_isLessOrEqualToFloatNumber:(NSNumber *)floatNumber {
    return [self ett_isLessThanFloatNumber:floatNumber] || [self ett_isEqualToFloatNumber:floatNumber];
}

@end
