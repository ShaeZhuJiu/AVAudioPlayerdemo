//
//  ViewController.m
//  播放音频
//
//  Created by 谢鑫 on 2020/2/25.
//  Copyright © 2020 Shae. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>
@property (nonatomic,strong)AVAudioPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (AVAudioPlayer *)player{
    NSString *urlString=[[NSBundle mainBundle]pathForResource:@"bg" ofType:@"mp3"];
    NSURL *url=[NSURL fileURLWithPath:urlString];
    if (_player==nil) {
        _player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        _player.delegate=self;
    }
    return _player;
}
- (IBAction)play:(UIButton *)sender {
    [self.player play];
}
- (IBAction)pause:(UIButton *)sender {
    [self.player pause];
}
- (IBAction)stop:(UIButton *)sender {
    [self.player stop];
    self.player=nil;
}
- (IBAction)valueChange:(UISlider *)sender {
    self.player.volume=sender.value;
}
#pragma mark -- AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}
//中断开始时调用
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    [self.player pause];
    NSLog(@"%s",__func__);
    
}
//中断结束时调用
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withFlags:(NSUInteger)flags {
    [self.player play];
    NSLog(@"%s",__func__);
    
}

@end
