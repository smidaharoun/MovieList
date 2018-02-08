//
//  APIManager.h
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void) getMovies:(void (^)(NSArray *response))success failure:(void(^)(NSError* error))failure;

@end
