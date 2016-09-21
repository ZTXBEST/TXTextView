//
//  TXTextView.h
//  TXTextView
//
//  Created by 赵天旭 on 16/9/14.
//  Copyright © 2016年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXTextView : UITextView

/**
 *  default string is drawn 70% gray
 */
@property (nonatomic,strong)UIColor *placeholderColor;

/**
 *  default is nil.
 */
@property (nonatomic,strong)NSString *placeholder;

/**
 *  是否支持换行，默认支持
 */
@property (nonatomic,assign)BOOL isSupportANewline;

@end
