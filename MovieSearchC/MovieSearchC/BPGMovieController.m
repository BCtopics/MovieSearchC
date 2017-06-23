//
//  BPGMovieController.m
//  MovieSearchC
//
//  Created by Bradley GIlmore on 6/23/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGMovieController.h"
#import "BPGMovie.h"

@implementation BPGMovieController

+(void)fetchMovieForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<BPGMovie *> * _Nullable))completion {
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie/"];
    
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:@"5e7143caf64c9dcaf5a72c99b24535e3"];
    NSURLQueryItem *searchTermQueryItem = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm.lowercaseString];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[apiQueryItem, searchTermQueryItem];
    
    NSLog(@"Completed URL: %@", urlComponents.URL);
    
    NSURL *movieSearchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:movieSearchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching responses: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error data is nil, please try again");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON parsing error. Is jsondictionary type NSdictionary?");
            completion(nil);
            return;
        }
        
        NSMutableArray *movies = [[NSMutableArray alloc] init];
        
        for (NSDictionary *resultsDictionary in jsonDictionary[@"results"]) {
            BPGMovie *movie = [[BPGMovie alloc] initWithDictionary:resultsDictionary];
            [movies addObject:movie];
        }
        
        completion(movies);
        
    }] resume];
    
}

@end
