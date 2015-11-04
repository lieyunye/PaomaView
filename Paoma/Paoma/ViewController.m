//
//  ViewController.m
//  Paoma
//
//  Created by lieyunye on 11/3/15.
//  Copyright © 2015 lieyunye. All rights reserved.
//

#import "ViewController.h"
#import "LYYPaomaView.h"

@interface ViewController ()
{

    LYYPaomaView *_view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _view = [[LYYPaomaView alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    [self.view addSubview:_view];
    [_view setPaomaContent:@"一二三四五里七八九十ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickAction:(id)sender {
    [_view startAnimation];
}





@end
