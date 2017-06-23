//
//  BPGMovieController.h
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPGMovie;

NS_ASSUME_NONNULL_BEGIN

@interface BPGMovieController : NSObject

+(void)fetchMovieForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<BPGMovie *> *))completion;

//Not sure what style your looking for here. But here's the NS_Assume_Nonnull begin/end way. If you wanted the _nullable then here's what the function would look like. +(void)fetchMovieForSearchTerm:(NSString *_Nullable)searchTerm completion:(void (^_Nullable)(NSArray<BPGMovie *> * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
