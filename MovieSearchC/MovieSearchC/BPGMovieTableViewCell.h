//
//  BPGMovieTableViewCell.h
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPGMovieTableViewCell : UITableViewCell

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@end
