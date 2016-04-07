//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Daniel Rodas on 4/2/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) Media *media;

- (instancetype) initWithMedia:(Media *)media;

- (void) centerScrollView;

- (void) recalculateZoomScale;

@end
