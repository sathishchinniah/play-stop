//
//  ViewController.m
//  stop
//
//  Created by Sathish Chinniah on 08/08/14.
//  Copyright (c) 2014 Sathish Chinniah. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#import <AVFoundation/AVFoundation.h>


@interface ViewController ()


@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
- (IBAction)playSound:(id)sender;
- (IBAction)stopSound:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"(ABCD)_-_Sadda_Dil_Vi_Tu_(Ga_Ga_Ga_Ganpati)_Official_New_HD_Full_Song_V" ofType:@"mp3"];
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData  error:&error];
    
    [self.audioPlayer prepareToPlay];
    self.audioPlayer.numberOfLoops = -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-
(IBAction)playSound:(id)sender {
    [self.audioPlayer play];
    
    UIView *wrapperView = [[UIView alloc] initWithFrame:CGRectMake(20, 120, 260, 20)];
    wrapperView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:wrapperView];
    
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame: wrapperView.bounds];
    [wrapperView addSubview:volumeView];
}
- (IBAction)stopSound:(id)sender {
    
     [self.audioPlayer stop];
    
}

@end
