//
//  LibraryCollectionViewCell.m
//  
//
//  Created by Daniel Rodas on 4/5/16.
//
//

#import "LibraryCollectionViewCell.h"

@implementation LibraryCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        self.imageView.tag = imageViewTag;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}


@end