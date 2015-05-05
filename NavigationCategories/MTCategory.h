//
//  MTCategory.h
//  NavigationCategories
//
//  Created by Hawer Torres on 5/4/15.
//  Copyright (c) 2015 Hawer Torres. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <CoreData/CoreData.h>

@interface MTCategory : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (strong, nonatomic) NSNumber * categoryID;
@property (strong, nonatomic) NSString * categoryName;
@property (strong, nonatomic) NSString * refinementType;
@property (strong, nonatomic) NSSet *subcategories;

@end
