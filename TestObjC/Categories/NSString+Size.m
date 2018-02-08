//
//  NSString+Size.m
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)heightWithConstrainedWidth:(CGFloat)width font:(UIFont*)font {
    CGSize constraintRect = CGSizeMake(width, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{ NSFontAttributeName : font };
    CGRect boundingBow = [self boundingRectWithSize:constraintRect options:options attributes:attributes context:nil];
    return ceilf(boundingBow.size.height);
}

@end
