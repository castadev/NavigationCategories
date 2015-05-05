//
//  ViewController.m
//  NavigationCategories
//
//  Created by Hawer Torres on 5/4/15.
//  Copyright (c) 2015 Hawer Torres. All rights reserved.
//

#import "ViewControllerCategories.h"
#import "MTCategory.h"
#import "NCCoreDataStack.h"
#import <AFNetworking/AFJSONRequestOperation.h>

@interface ViewControllerCategories ()

@end

@implementation ViewControllerCategories

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadCategories];
}

#pragma mark - Private

- (void)downloadCategories
{
    NSURL *url = [NSURL URLWithString:@"https://stormy-refuge-5502.herokuapp.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^
                                                (NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSError *error;
        NSArray *categories = [MTLJSONAdapter modelsOfClass:[MTCategory class] fromJSONArray:JSON error:&error];
        for (MTCategory *element in categories) {
            NSError *error;
            NCCoreDataStack *coreDataStack = [NCCoreDataStack sharedStack];
            [MTLManagedObjectAdapter managedObjectFromModel:element insertingIntoContext:coreDataStack.managedObjectContext error:&error ];
            if([coreDataStack.managedObjectContext save:&error]){
                NSLog(@"Succeeds");
            }else{
                NSLog(@"Unable to save: %@", [error description]);
            }
        }
                                                    
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Unable to request operation: %@", [error description]);
    }];
    
    [requestOperation start];
}

@end
