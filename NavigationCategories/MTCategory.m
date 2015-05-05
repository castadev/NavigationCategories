//
//  MTCategory.m
//  NavigationCategories
//
//  Created by Hawer Torres on 5/4/15.
//  Copyright (c) 2015 Hawer Torres. All rights reserved.
//

#import "MTCategory.h"
#import "NCCategory.h"

@implementation MTCategory

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"categoryID":@"categoryID",
             @"categoryName":@"categoryName",
             @"refinementType":@"refinementType",
             @"subcategories":@"subcategories"
             };
}

+ (NSValueTransformer *)subcategoriesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:MTCategory.class];
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName
{
    return @"Category";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{
             @"categoryID":@"categoryID",
             @"categoryName":@"categoryName",
             @"refinementType":@"refinementType",
             @"subcategories":@"subcategories"
             };
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey
{
    return @{ @"subcategories" : MTCategory.class };
}

@end
