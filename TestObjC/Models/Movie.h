//
//  Movie.h
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *text;
@property int year;

+ (NSArray*)arrayOfModelsFromDictionaries:(NSArray*)dictionaries;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
