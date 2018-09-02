//
//  Music.m
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import "Music.h"

@implementation Music

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"trackCount": @"resultCount",
             @"trackList": @"results"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"trackList" : @"Track"};
}
@end


@implementation Track

@end

