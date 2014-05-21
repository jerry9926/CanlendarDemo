//
//  NSDate+String.m
//  CanlendarDemo
//
//  Created by ray on 5/21/14.
//  Copyright (c) 2014 kuler huang. All rights reserved.
//

#import "NSDate+String.h"

@implementation NSDate (String)

+(NSDate *) convertDateFromString:(NSString*)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM"];
    NSDate *date=[formatter dateFromString:dateString];
    return date;
}

@end
