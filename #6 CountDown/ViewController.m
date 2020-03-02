//
//  ViewController.m
//  #6 CountDown
//
//  Created by ChunYi on 2020/3/2.
//  Copyright © 2020 ES711-apple-2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int second;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CountDown];
}

- (void)updateTime:(NSTimer *)timer{
    self.second -= 1;
    self.timelb.text = [NSString stringWithFormat:@"%d", self.second];
    if(self.second == 0){
        _mLabel.text = @"時間到";
        [timer invalidate];//停止這個Timer
    }
    
}

- (IBAction)restartCount:(id)sender {
    [self CountDown];
}

- (void)CountDown{
    _mLabel.text = @""; //一開始不顯示
    self.second = 5;    //時間設五秒
    self.timelb.text = [NSString stringWithFormat:@"%d", self.second];
    
    //每一秒做一次，並且重複執行這個方法
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    
}

@end
