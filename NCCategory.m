//
//  NCCategory.m
//  NavigationCategories
//
//  Created by Hawer Torres on 5/4/15.
//  Copyright (c) 2015 Hawer Torres. All rights reserved.
//

#import "NCCategory.h"
#import "NCCategory.h"


@implementation NCCategory

@dynamic categoryID;
@dynamic categoryName;
@dynamic refinementType;
@dynamic subcategories;
@dynamic category;

+ (NSString *)entityName
{
    return @"MTCategory";
}

@end
