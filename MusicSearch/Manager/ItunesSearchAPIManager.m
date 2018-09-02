//
//  ItunesSearchAPIManager.m
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import "ItunesSearchAPIManager.h"
#import "AFHTTPSessionManager.h"

@interface ItunesSearchAPIManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end


@implementation ItunesSearchAPIManager

#pragma mark - Initializing
+ (instancetype)sharedInstance {
    static ItunesSearchAPIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItunesSearchAPIManager alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.operationQueue.maxConcurrentOperationCount = 5;
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 30.0f; 
        _manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/json",@"text/javascript",nil];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

#pragma mark - Search API
-(void)searchMusicFor:(NSString *)searchTerm
{
    NSString *url=@"https://itunes.apple.com/search";
    NSDictionary *parameters=@{  @"term" : searchTerm,
                                 @"media": @"music"
                              };
    
    [self.manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.searchSuccessBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error (searchMusicFor): %@", [error localizedDescription]);
    }];
}
@end
