//
//  TrackViewCell.m
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import "TrackViewCell.h"
#import "UIImageView+WebCache.h"
#import "Music.h"
#import "AudioStreamPlayer.h"

@interface TrackViewCell()

@end

@implementation TrackViewCell

#pragma mark - Initializing
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - Setter
-(void)setTrack:(Track *)track
{
    _track = track;
    [self updateUI];
}

#pragma mark - UI
-(void)updateUI
{
    self.songNameLbl.text = _track.trackName;
    self.artistNameLbl.text = _track.artistName;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_track.artworkUrl60] placeholderImage:[UIImage imageNamed:@"iTunes_logo"]];
}

#pragma mark - Event handle
- (IBAction)playerButtonClicked:(id)sender {
 
    if(self.player){
       [self.player playWithUrl:[NSURL URLWithString:self.track.previewUrl]];
    }
}

@end
