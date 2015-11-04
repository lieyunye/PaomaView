//
//  LYYPaomaView.h
//  Paoma
//
//  Created by lieyunye on 11/4/15.
//  Copyright © 2015 lieyunye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYYPaomaView : UIView

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat interval;
- (void)setPaomaContent:(NSString *)content;
- (void)startAnimation;
- (void)stopAnimation;


@end
