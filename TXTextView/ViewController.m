//
//  ViewController.m
//  TXTextView
//
//  Created by 赵天旭 on 16/9/14.
//  Copyright © 2016年 ZTX. All rights reserved.
//

#import "ViewController.h"
#import "TXTextView.h"
@interface ViewController ()
@property (nonatomic,strong)TXTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"TXTextView";
    
    UITextField
    
    _textView=[[TXTextView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    _textView.textColor=[UIColor blackColor];
    _textView.font=[UIFont systemFontOfSize:15.0f];
    _textView.returnKeyType=UIReturnKeyDone;
    _textView.placeholderColor=RGB(153, 153, 153);
    _textView.placeholder=@"我们非常重视您的想法和意见，请在此留下您宝贵的反馈信息。";
    [self.view addSubview:_textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
