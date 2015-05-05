//
//  NCCategory.h
//  NavigationCategories
//
//  Created by Hawer Torres on 5/4/15.
//  Copyright (c) 2015 Hawer Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NCCategory;

@interface NCCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * categoryID;
@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSString * refinementType;
@property (nonatomic, retain) NSSet *subcategories;
@property (nonatomic, retain) NCCategory *category;
@end

@interface NCCategory (CoreDataGeneratedAccessors)

- (void)addSubcategoriesObject:(NCCategory *)value;
- (void)removeSubcategoriesObject:(NCCategory *)value;
- (void)addSubcategories:(NSSet *)values;
- (void)removeSubcategories:(NSSet *)values;

+ (NSString *)entityName;

@end
