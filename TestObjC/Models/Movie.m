//
//  Movie.m
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (NSArray*)arrayOfModelsFromDictionaries:(NSArray*)dictionaries {
    NSMutableArray* models = [NSMutableArray new];
    for (NSDictionary* dictionary in dictionaries) {
        [models addObject:[[Movie alloc] initWithDictionary:dictionary]];
    }
    return models;
}


- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _title = dict[@"title"];
        _image = dict[@"image"];
        _intro = dict[@"intro"];
        _text = dict[@"text"];
        _year = [dict[@"year"] intValue];
    }
    return self;
}

@end
