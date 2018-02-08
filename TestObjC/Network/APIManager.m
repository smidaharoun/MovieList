//
//  APIManager.m
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "APIManager.h"
#import "Movie.h"

@implementation APIManager

+ (void) getMovies:(void (^)(NSArray *response))success failure:(void(^)(NSError* error))failure {
    NSURL* url = [NSURL URLWithString:@"http://www.mocky.io/v2/5915cf73100000470575966f"];
    NSURLSessionTask* task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
            failure(error);
        else {
            NSError *error = nil;
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
            NSArray* data = [[Movie arrayOfModelsFromDictionaries:array] mutableCopy];
            success(data);
        }
    }];
    [task resume];
}

@end
