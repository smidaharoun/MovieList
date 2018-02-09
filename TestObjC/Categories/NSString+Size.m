//
//  NSString+Size.m
//  TestObjC
//
//  Created by Haroun SMIDA on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

/**
 * Calcule the height of the string with given width and font.
 *
 * @param width The constraint width of the string.
 * @param font The font used by the control.
 * @return height of the given string.
 */
- (CGFloat)heightWithConstrainedWidth:(CGFloat)width font:(UIFont*)font {
    CGSize constraintRect = CGSizeMake(width, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{ NSFontAttributeName : font };
    CGRect boundingBow = [self boundingRectWithSize:constraintRect options:options attributes:attributes context:nil];
    return ceilf(boundingBow.size.height);
}

@end
