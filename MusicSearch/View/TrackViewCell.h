//
//  TrackViewCell.h
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Track;
@class AudioStreamPlayer;

@interface TrackViewCell : UITableViewCell

@property (strong, nonatomic) Track *track;
@property (strong, nonatomic) AudioStreamPlayer *player;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *songNameLbl;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLbl;

@end
