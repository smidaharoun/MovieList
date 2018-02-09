//
//  MovieListTableViewController.m
//  TestObjC
//
//  Created by Haroun SMIDA on 2/8/18.
//  Copyright © 2018 sonic. All rights reserved.
//

#import "MovieListTableViewController.h"
#import "MovieTableViewCell.h"
#import "Movie.h"
#import "APIManager.h"
#import "MovieDetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "NSString+Size.h"

@interface MovieListTableViewController ()

@end

@implementation MovieListTableViewController

#pragma mark Global variables

NSInteger lastExtendedRow = -1;

#pragma mark View controller methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeViews];
    [self loadData];
}

#pragma mark Initialization

- (void)initializeViews {
    self.title = @"Star Wars";
    [self.navigationController.navigationBar setTranslucent:false];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark Handle Data

- (void)loadData {
    [APIManager getMovies:^(NSArray *response) {
        _data = [response mutableCopy];
        [_data sortUsingComparator:^NSComparisonResult(Movie* obj1, Movie* obj2) {
            return [@(obj1.year) compare:@(obj2.year)];
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error: %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (lastExtendedRow == indexPath.row) {
        return 150 + [[_data[indexPath.row] intro] heightWithConstrainedWidth:self.view.frame.size.width - 118 font:[UIFont systemFontOfSize:13]] - 51;
    }
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MovieTableViewCell class]) forIndexPath:indexPath];
    Movie* item = _data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = item.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"%i", item.year];
    cell.introLabel.text = item.intro;
    [cell.seeMoreButton setTag:indexPath.row];
    [cell.seeMoreButton addTarget:self action:@selector(seeMoreAction:) forControlEvents:UIControlEventTouchUpInside];
    if (lastExtendedRow != indexPath.row) {
        cell.seeMoreButton.transform = CGAffineTransformMakeRotation(0);
    } else {
        cell.seeMoreButton.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    }
    [cell.coverImageView sd_setImageWithURL:[NSURL URLWithString:item.image]];
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailsViewController* viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MovieDetailsViewController class])];
    viewController.data = _data[indexPath.row];
    [self.navigationController pushViewController:viewController animated:true];
}

#pragma mark - IBActions

- (void)seeMoreAction:(UIButton*)sender {
    MovieTableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
    CGFloat angle = M_PI * 0.5;
    if (lastExtendedRow == sender.tag) {
        lastExtendedRow = -1;
        angle = 0;
    } else {
        MovieTableViewCell* previousCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:lastExtendedRow inSection:0]];
        if (previousCell) {
            [UIView animateWithDuration:0.2 animations:^{
                previousCell.seeMoreButton.transform = CGAffineTransformMakeRotation(0);
            }];
        }
        lastExtendedRow = sender.tag;
    }
    [UIView animateWithDuration:0.2 animations:^{
        cell.seeMoreButton.transform = CGAffineTransformMakeRotation(angle);
    }];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
