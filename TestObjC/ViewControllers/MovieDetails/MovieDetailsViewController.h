//
//  MovieDetailsViewController.h
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailsViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *coverImageView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *introLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic)  Movie *data;

@end
