//
//  MovieTableViewCell.h
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell

@property (unsafe_unretained, nonatomic) IBOutlet UIView *borderContentView;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *coverImageView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *titleLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *introLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *yearLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *seeMoreButton;

@end
