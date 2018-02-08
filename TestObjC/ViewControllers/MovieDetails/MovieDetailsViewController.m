//
//  MovieDetailsViewController.m
//  TestObjC
//
//  Created by ODC on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "UIImageView+WebCache.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData {
    self.title = _data.title;
    _introLabel.text = _data.intro;
    _textLabel.text = _data.text;
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:_data.image]];
}

@end
