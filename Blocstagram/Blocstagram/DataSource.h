//
//  DataSource.h
//  Blocstagram
//
//  Created by Daniel Rodas on 3/29/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

- (void) deleteMediaItem:(Media *)item;
- (void) replaceObjectInMediaItemsAtIndex:(NSUInteger)index withObject:(id)object;
- (void) removeObjectFromMediaItemsAtIndex:(NSUInteger)index;
- (void) insertObject:(Media *)object inMediaItemsAtIndex:(NSUInteger)index;

@end
