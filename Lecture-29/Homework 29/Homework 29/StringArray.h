//
//  StringArray.h
//  Homework 29
//
//  Created by Vyacheslav Pronin on 30.08.2021.
//

#import <Foundation/Foundation.h>
#import "StringArrayDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface StringArray : NSObject <StringArrayDelegate>

- (NSArray *)getStringArray;

@end

NS_ASSUME_NONNULL_END
