//
//  LikeButton.m
//  Blocstagram
//
//  Created by Daniel Rodas on 4/4/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "LikeButton.h"
#import "CircleSpinnerView.h"
#import "Media.h"

#define kLikedStateImage @"heart-full"
#define kUnlikedStateImage @"heart-empty"

@interface LikeButton ()

@property (nonatomic, strong) CircleSpinnerView *spinnerView;
@property (nonatomic, strong) UILabel *likesLabel;

@end

@implementation LikeButton

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.spinnerView = [[CircleSpinnerView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        self.likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [self addSubview:self.spinnerView];
        [self addSubview:self.likesLabel];
        
        //self.likesLabel.text = @"hi";
        //self.likesLabel.backgroundColor = [UIColor whiteColor];
        self.likesLabel.textAlignment = NSTextAlignmentRight;
        self.likesLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:self.spinnerView];
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        
        self.likeButtonState = LikeStateNotLiked;
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    self.spinnerView.frame = self.imageView.frame;
    self.likesLabel.frame = CGRectMake(self.imageView.frame.size.width - 55, 0, 36, 36);
}

- (void) setLikeButtonState:(LikeState)likeState {
    _likeButtonState = likeState;
    
    NSString *imageName;
    
    switch (_likeButtonState) {
        case LikeStateLiked:
        case LikeStateUnliking:
            self.likesLabel.text = [NSString stringWithFormat:@"%ld",self.likeCount];
            imageName = kLikedStateImage;
            break;
            
        case LikeStateNotLiked:
        case LikeStateLiking:
            self.likesLabel.text = [NSString stringWithFormat:@"%ld",self.likeCount];
            imageName = kUnlikedStateImage;
    }
    
    switch (_likeButtonState) {
        case LikeStateLiking:
        case LikeStateUnliking:
            self.spinnerView.hidden = NO;
            self.userInteractionEnabled = NO;
            break;
            
        case LikeStateLiked:
        case LikeStateNotLiked:
            self.spinnerView.hidden = YES;
            self.userInteractionEnabled = YES;
    }
    
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
