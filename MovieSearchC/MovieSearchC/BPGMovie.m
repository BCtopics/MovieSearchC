//
//  BPGMovie.m
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGMovie.h"

@implementation BPGMovie

#pragma mark - Keys

static NSString * const kTitle = @"title";
static NSString * const kRating = @"vote_average";
static NSString * const kSummary = @"overview";

#pragma mark - Initializers

- (instancetype)initWithTitle:(NSString *)title summary:(NSString *)summary rating:(double)rating
{
    self = [super init];
    if (self){
        _title = title;
        _summary = summary;
        _rating = rating;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[kTitle];
    NSString *summary = dictionary[kSummary];
    double rating = [dictionary[kRating] integerValue];
    return [self initWithTitle:title summary:summary rating:rating];
}

@end
