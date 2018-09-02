//
//  AudioStreamPlayer.h
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioStreamPlayer: NSObject

+ (instancetype)sharedInstance;
- (void)playWithUrl:(NSURL *)url;
- (void)puasePlay;

@end
