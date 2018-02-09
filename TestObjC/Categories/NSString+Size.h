//
//  NSString+Size.h
//  TestObjC
//
//  Created by Haroun SMIDA on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGFloat)heightWithConstrainedWidth:(CGFloat)width font:(UIFont*)font;

@end
