//
//  DAlertView.m
//  DAlertView
//
//  Created by Destiny on 2019/1/15.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "DAlertView.h"
#import "UIView+Size.h"

#define kDAlertScreenWidth                [UIScreen mainScreen].bounds.size.width
#define kDAlertScreenHeight               [UIScreen mainScreen].bounds.size.height

const static CGFloat kHeaderViewHeight       = 50;
const static CGFloat kFooterViewHeight       = 50;

const static CGFloat kMessageFontSize               = 14;
const static CGFloat kTitleFontSize               = 18;

@interface DAlertView ()

// action数组
@property (nonatomic, strong) NSMutableArray *actions;
/**头部View*/
@property (nonatomic, strong) UIView *headerView;
/**文本View*/
@property (nonatomic, strong) UIView *contentView;
/**底部View*/
@property (nonatomic, strong) UIView *footerView;
/**对话框View*/
@property (nonatomic, retain) UIView *dialogView;

@end

@implementation DAlertView

- (NSMutableArray *)actions
{
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    DAlertView *alertView = [[DAlertView alloc] initWithTitle:title message:message customAlertView:nil customHeaderView:nil customActionSequenceView:nil componentView:nil animationType:AlertAnimationTypeDefault];
    return alertView;
}

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message customAlertView:(UIView *)customAlertView customHeaderView:(UIView *)customHeaderView customActionSequenceView:(UIView *)customActionSequenceView componentView:(UIView *)componentView  animationType:(AlertAnimationType)animationType {
    self = [self init];
    
    _title = title;
    _message = message;
    _animationType = animationType;
    _customAlertView = customAlertView;
    
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _titleFont = [UIFont boldSystemFontOfSize:kTitleFontSize];
    _titleColor = [UIColor blackColor];
    _messageFont = [UIFont systemFontOfSize:kMessageFontSize];
    _messageColor = [UIColor grayColor];
    _textAlignment = NSTextAlignmentCenter;
    _lineColor = [UIColor lightGrayColor];
}

// 添加action
- (void)addAction:(DAlertAction *)action {
    [self.actions addObject:action];
}

- (void)show
{
    _dialogView = [self createDialogView];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:_dialogView];
     [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self];
}

- (void)dismiss
{
    CATransform3D currentTransform = _dialogView.layer.transform;
    _dialogView.layer.opacity = 1.0f;
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         weakSelf.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
                         weakSelf.dialogView.layer.opacity = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         for (UIView *v in [self subviews]) {
                             [v removeFromSuperview];
                         }
                         [self removeFromSuperview];
                         
                     }
     ];
}


/**
 初始化对话框
 @return 对话框View
 */
- (UIView *)createDialogView
{
    // 获取对话框Size
    CGSize dialogSize = [self getDialogViewSize];
   
    // 设置Frame
    [self setFrame:CGRectMake(0, 0, kDAlertScreenWidth, kDAlertScreenHeight)];
    // 初始化对话框View
     UIView *dialogView = [[UIView alloc] initWithFrame:CGRectMake((kDAlertScreenWidth - dialogSize.width) / 2, (kDAlertScreenHeight - dialogSize.height) / 2, dialogSize.width, dialogSize.height)];
    dialogView.backgroundColor = _lineColor;
    dialogView.layer.masksToBounds = YES;
    dialogView.layer.cornerRadius = 10.;
    
    UIView *headerView = nil;
    if (_title.length > 0) {
        headerView =  [self createHeaderView:CGRectMake(0, 0, dialogSize.width, kHeaderViewHeight)];
        [dialogView addSubview:headerView];
    }
    
    UIView *contentView = [self createContentView: CGRectMake(0, _title.length>0?kHeaderViewHeight+0.5:0, dialogSize.width, [self getContentViewHeight])];
    [dialogView addSubview:contentView];
    
    UIView *footerView = [self createFooterView:CGRectMake(0, contentView.bottom+0.5, dialogSize.width, kFooterViewHeight)];
    [dialogView addSubview:footerView];
    
    return dialogView;
}


/**
 初始化HeaderView
 @return HeaderView
 */
- (UIView *)createHeaderView:(CGRect)frame
{
    // 获取对话框Size
    UIView *headerView = [[UIView alloc]initWithFrame:frame];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(10, 0, headerView.width-20, headerView.height);
    titleLabel.font = _titleFont?_titleFont:[UIFont systemFontOfSize:kMessageFontSize];
    titleLabel.textColor = _titleColor?_titleColor:[UIColor blackColor];
    titleLabel.text = _title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    return headerView;
}

/**
 初始化ContentView
 @return ContentView
 */
- (UIView *)createContentView:(CGRect)frame
{
    UIView *contentView = [[UIView alloc]initWithFrame:frame];
    contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *msgLabel = [UILabel new];
    msgLabel.frame = CGRectMake(10, 10, contentView.width-20, contentView.height-20);
    msgLabel.font = _messageFont?_messageFont:[UIFont systemFontOfSize:kMessageFontSize];
    msgLabel.textColor = _messageColor?_messageColor:[UIColor blackColor];
    msgLabel.text = _message;
    msgLabel.numberOfLines = 0;
    [contentView addSubview:msgLabel];
    
    return contentView;
}

/**
 初始化FooterView
 @return FooterView
 */
- (UIView *)createFooterView:(CGRect)frame
{
    UIView *footerView = [[UIView alloc]initWithFrame:frame];
    footerView.backgroundColor = _lineColor;
    
    CGFloat dailogWidth = [self getDialogWidth];
    
    CGFloat btnWidth = dailogWidth/self.actions.count;
    
    for (int i = 0; i < self.actions.count; i++) {
        
        DAlertAction *action = self.actions[i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*btnWidth+i*0.5, 0, btnWidth, kFooterViewHeight);
        [btn setTitle:action.title forState:UIControlStateNormal];
        [btn setTitleColor:action.titleColor forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.tag = i;
        btn.titleLabel.font = action.titleFont;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [footerView addSubview:btn];
    }
    return footerView;
}

- (void)btnAction:(UIButton *)btn
{
    DAlertAction *action = self.actions[btn.tag];
    action.handler(action);
    
    [self dismiss];
}

#pragma Helper

/**
 获取对话框的Size
 @return Size
 */
- (CGSize)getDialogViewSize
{
    CGFloat dialogWidth = [self getDialogWidth];
    
    CGFloat dialogHeight = self.title.length==0? kFooterViewHeight + [self getContentViewHeight]:kHeaderViewHeight + kFooterViewHeight + [self getContentViewHeight];
    
    return CGSizeMake(dialogWidth, dialogHeight);
}

/**
 获取对话框宽度
 @return width
 */
- (CGFloat)getDialogWidth
{
     return kDAlertScreenWidth-80;
}

/**
 获取ContentView高度
 @return height
 */
- (CGFloat)getContentViewHeight
{
    CGSize textSize = [self getTextSize:_message textWidth:[self getDialogWidth]-20 fontSize:_messageFont?_messageFont.pointSize:kMessageFontSize];
    
    CGFloat height = textSize.height + 60 <= kDAlertScreenHeight-180 ? textSize.height + 60 :  kDAlertScreenHeight-180;
    return height;
}

/**
 获取文本Size
 @param string 文本
 @param textWidth 文本宽度
 @param fontSize 字体大小
 @return Size
 */
-(CGSize)getTextSize:(NSString *)string textWidth:(CGFloat)textWidth fontSize:(CGFloat)fontSize{
    UIFont * tfont = [UIFont systemFontOfSize:fontSize];
    // 高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    CGSize size =CGSizeMake(textWidth,CGFLOAT_MAX);
    // 获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    
    return actualsize;
    
}


@end
