//
//  MovieTableViewCell.m
//  TestObjC
//
//  Created by Haroun SMIDA on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_borderContentView setClipsToBounds:true];
    [_borderContentView.layer setCornerRadius:18];
    [_borderContentView.layer setBorderColor:UIColor.lightGrayColor.CGColor];
    [_borderContentView.layer setBorderWidth:1];
    [_coverImageView setClipsToBounds:true];
    [_coverImageView.layer setCornerRadius:18];
    [_introLabel setContentMode:UIViewContentModeTop];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [_borderContentView setBackgroundColor:selected ? UIColor.lightGrayColor : UIColor.whiteColor];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    [_borderContentView setBackgroundColor:highlighted ? UIColor.lightGrayColor : UIColor.whiteColor];
}

@end
