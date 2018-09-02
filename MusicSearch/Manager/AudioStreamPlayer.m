//
//  AudioStreamPlayer.m
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import "AudioStreamPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioStreamPlayer()
@property (nonatomic, strong) AVPlayer *streamPlayer;
@property (nonatomic, strong) AVPlayerItem *trackItem;
@end


@implementation AudioStreamPlayer

#pragma mark - Initializing
+ (instancetype)sharedInstance {
    static AudioStreamPlayer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AudioStreamPlayer alloc]init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    return self;
}

#pragma mark - Player control
-(void)playWithUrl:(NSURL *)url
{
    self.trackItem = [AVPlayerItem playerItemWithURL:url];
    
    if (self.streamPlayer) {
        [self.streamPlayer replaceCurrentItemWithPlayerItem:self.trackItem];
    }else{
        self.streamPlayer = [AVPlayer playerWithPlayerItem:self.trackItem];
    }
    
    [self.streamPlayer play];
}

-(void)puasePlay
{
    [self.streamPlayer pause];
}

@end
