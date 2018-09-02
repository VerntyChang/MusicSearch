//
//  Music.h
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface Music : NSObject
@property (nonatomic, assign) int trackCount;
@property (nonatomic, strong) NSArray *trackList;
@end


@interface Track : NSObject
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *collectionName;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *artworkUrl60;
@property (nonatomic, strong) NSString *previewUrl;
@end
