//
//  ItunesSearchAPIManager.h
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^searchSuccess)(id responseObject);

@interface ItunesSearchAPIManager: NSObject

@property (nonatomic, copy) searchSuccess searchSuccessBlock;

+ (instancetype)sharedInstance;
- (void)searchMusicFor:(NSString *)searchTerm;

@end
