//
//  LYYPaomaView.m
//  Paoma
//
//  Created by lieyunye on 11/4/15.
//  Copyright © 2015 lieyunye. All rights reserved.
//

#import "LYYPaomaView.h"

@implementation LYYPaomaView
{
    UILabel *_label1;
    UILabel *_label2;
    
    CGRect _label1Frame;
    CGRect _label2Frame;
    
    NSMutableArray *_labelArray;
    
    BOOL _stopAnimation;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        _fontSize = 17;
        _duration = 5;
        _interval = 10;
        _color = [UIColor blackColor];
        
        _label1 = [[UILabel alloc] init];
        _label2 = [[UILabel alloc] init];
        
        [self addSubview:_label1];
        [self addSubview:_label2];
        
        _labelArray = [[NSMutableArray alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIApplicationDidBecomeActiveNotification) name:UIApplicationDidBecomeActiveNotification object:nil];
        
        
    }
    return self;
}

- (void)setPaomaContent:(NSString *)content
{
    [self stopAnimation];
    _label1.font = [UIFont systemFontOfSize:_fontSize];
    _label1.text = content;
    _label2.text = _label1.text;
    _label1.textColor = _color;
    _label2.textColor = _color;
    CGSize sizeOfText = [_label1 sizeThatFits:CGSizeZero];
    
    _label1Frame = CGRectMake(0, 0, sizeOfText.width + _interval, sizeOfText.height);
    if (sizeOfText.width < CGRectGetWidth(self.frame)) {
        _label1Frame = self.bounds;
        _label1.textAlignment = NSTextAlignmentCenter;
    }
    _label2Frame = CGRectMake(_label1Frame.origin.x + CGRectGetWidth(_label1Frame), _label1Frame.origin.y, CGRectGetWidth(_label1Frame), CGRectGetHeight(_label1Frame));
    _label1.frame = _label1Frame;
    _label2.frame = _label2Frame;
    
    [_labelArray addObject:_label1];
    [_labelArray addObject:_label2];
    _stopAnimation = NO;
    [self startAnimation];
    
}

- (void)startAnimation
{
    if (CGRectGetWidth(_label1Frame) <= CGRectGetWidth(self.frame)) {
        return;
    }
    UILabel *tempLabel1 = _labelArray.firstObject;
    UILabel *tempLabel2 = _labelArray.lastObject;
    [UIView animateWithDuration:_duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        tempLabel1.frame = CGRectMake(-CGRectGetWidth(_label1Frame), _label1Frame.origin.y, CGRectGetWidth(_label1Frame), CGRectGetHeight(_label1Frame));
        tempLabel2.frame =  CGRectMake(tempLabel1.frame.origin.x + CGRectGetWidth(_label1Frame), _label1Frame.origin.y, CGRectGetWidth(_label1Frame), CGRectGetHeight(_label1Frame));
    } completion:^(BOOL finished) {
        if (_stopAnimation) {
            [self stopAnimation];
            return;
        }
        if (finished) {
            tempLabel1.frame = _label2Frame;
            tempLabel2.frame = _label1Frame;
            [_labelArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
            
            [self startAnimation];
        }
    }];
}

- (void)stopAnimation
{
    _stopAnimation = YES;
    [_label1.layer removeAllAnimations];
    [_label2.layer removeAllAnimations];
    [_labelArray removeAllObjects];
    [self.layer removeAllAnimations];
}

- (void)UIApplicationDidBecomeActiveNotification
{
    [self startAnimation];
}
@end
