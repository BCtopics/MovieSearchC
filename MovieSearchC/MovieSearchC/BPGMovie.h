//
//  BPGMovie.h
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPGMovie : NSObject

#pragma mark - Initializers

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)sumamry
                       rating:(double)rating;

#pragma mark - Properties

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *summary;
@property (nonatomic, readonly) double rating;

@end
