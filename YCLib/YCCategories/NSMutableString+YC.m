//
//  NSMutableString+YC.m
//  iAlarm
//
//  Created by li shiyong on 12-6-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSMutableString+YC.h"

@implementation NSMutableString (YC)

/**
 anAddress是西文(单字节)，而且self又不是以“空格”或“,”或separater结束的，那么anAddress前加 separater
 **/
- (void)appendAddress:(NSString *)anAddress separater:(NSString*)separater{
    
    if (!anAddress || anAddress.length == 0) return;
    //anAddress =  [anAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //判断是否是单字节
    BOOL anAddressIsSimple = [anAddress canBeConvertedToEncoding:NSNEXTSTEPStringEncoding];
    
    //self最后一个字是否是单字节
    BOOL selfIsSimple = NO;
    if (self.length > 0) {
        NSString *lastString = [self substringFromIndex:self.length-1];
        selfIsSimple = [lastString canBeConvertedToEncoding:NSNEXTSTEPStringEncoding];
    }
    
    //self不是以“空格”或“,”或separater结束的
    if (self.length > 0) {
        if (anAddressIsSimple || selfIsSimple) {
            if (!([self hasSuffix:@" "] || [self hasSuffix:@","] || [self hasSuffix:separater])) {
                [self appendString:separater];
            }
        }
    }
    
    
    [self appendString:anAddress];
}

- (void)appendAddress:(NSString *)anAddress{
    [self appendAddress:anAddress separater:@" "];
}

@end
