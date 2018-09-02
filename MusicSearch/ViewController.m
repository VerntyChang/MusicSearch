//
//  ViewController.m
//  MusicSearch
//
//  Created by Vernty on 2018/9/1.
//  Copyright © 2018年 vernty. All rights reserved.
//

#import "ViewController.h"
#import "ItunesSearchAPIManager.h"
#import "AudioStreamPlayer.h"
#import "Music.h"
#import "TrackViewCell.h"
#import "NSObject+YYModel.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tracksTableView;
@property (strong, nonatomic) ItunesSearchAPIManager *iTunesSearchAPIManager;
@property (strong, nonatomic) AudioStreamPlayer *player;
@property (strong, nonatomic) Music *music;
@end

@implementation ViewController 

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.music.trackCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackCell" forIndexPath:indexPath];
    
    cell.track = self.music.trackList[indexPath.row];
    cell.player = self.player;
    return cell;
}

#pragma mark - Getter
- (ItunesSearchAPIManager *)iTunesSearchAPIManager{
    
    if(_iTunesSearchAPIManager == nil){

        _iTunesSearchAPIManager = [ItunesSearchAPIManager sharedInstance];
        
        __weak typeof(self) weakSelf = self;
        _iTunesSearchAPIManager.searchSuccessBlock = ^(id responseObject){
             weakSelf.music = [Music yy_modelWithJSON:responseObject];
             [weakSelf.tracksTableView reloadData];
        };
    }
    return _iTunesSearchAPIManager;
}

- (AudioStreamPlayer *)player{
    
    if(_player == nil){
         _player = [AudioStreamPlayer sharedInstance];
    }
    return _player;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
    [self.searchBar resignFirstResponder];
    [self.iTunesSearchAPIManager searchMusicFor:theSearchBar.text];
}

@end
