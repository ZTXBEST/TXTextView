//
//  TXTextView.m
//  TXTextView
//
//  Created by 赵天旭 on 16/9/14.
//  Copyright © 2016年 ZTX. All rights reserved.
//

#import "TXTextView.h"

@interface TXTextView ()
@property(nonatomic,strong)UILabel *placeholderLabel;
@end

@implementation TXTextView

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"text" context:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:nil];
        
//        [self addObserver:self
//               forKeyPath:@"text"
//                  options:NSKeyValueObservingOptionNew
//                  context:nil];
        
        self.textColor=[UIColor blackColor];
        self.font=[UIFont systemFontOfSize:15.0];
        self.placeholderColor= RGB(153,153,153);
        _placeholderLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0, self.bounds.size.width-10, self.bounds.size.height)];
        _placeholderLabel.numberOfLines=0;
        [self addSubview:_placeholderLabel];
        NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing=7.0f;
        self.typingAttributes=@{NSParagraphStyleAttributeName:paragraphStyle};
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder=placeholder;
    NSMutableParagraphStyle *paragraphStyle=[[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing=7.0f;
    NSAttributedString *attributedString=[[NSAttributedString alloc]initWithString:placeholder attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.placeholderColor}];
    _placeholderLabel.attributedText=attributedString;
    [_placeholderLabel sizeToFit];
    
    CGPoint point = CGPointMake(5, 8);
    CGRect frame = _placeholderLabel.frame;
    frame.origin = point;
    _placeholderLabel.frame = frame;
    
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    _placeholderLabel.font=font;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor=placeholderColor;
    _placeholderLabel.textColor=placeholderColor;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if (self.placeholder.length<=0) {
//        return;
//    }
//    if (self.text.length<=0) {
//        self.placeholderLabel.hidden=NO;
//    }
//    else{
//        self.placeholderLabel.hidden=YES;
//    }
//}

-(void)textChange:(NSNotification *)sender{
    if (self.placeholder.length<=0) {
        return;
    }
    if (self.text.length<=0) {
        self.placeholderLabel.hidden=NO;
    }
    else{
        self.placeholderLabel.hidden=YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
