//
//  StringArray.m
//  Homework 29
//
//  Created by Vyacheslav Pronin on 30.08.2021.
//

#import "StringArray.h"

@implementation StringArray

- (NSArray *)getStringArray {
    
    NSArray *array = @[
        @"vladislav",
        @"victoria",
        @"ivan",
        @"vavilon",
        @"veronika",
        @"vyacheslav",
        @"vakuum",
        @"vodovorot",
        @"v_perevod_v",
        @"denis"
        ];
    
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id  _Nonnull objOne, id  _Nonnull objTwo)
                            {
        
        NSUInteger objOneLetterCount = [[objOne componentsSeparatedByString:@"v"] count];
        NSUInteger objTwoLetterCount = [[objTwo componentsSeparatedByString:@"v"] count];
        
        if (objOneLetterCount < objTwoLetterCount) {
            return NSOrderedAscending;
        } else if (objTwoLetterCount < objOneLetterCount) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    return sortedArray;
}

@end
