//
//  DisplayHelper.h
//  Small
//
//  Created by David Lin on 12/07/11.
//  Copyright (c) 2012 WhiteSponge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DisplayHelper : NSObject

//add all the sprites to the batch node to display them
-(void) displayAllSprites :(NSMutableArray *)sprites batchNode:(CCSpriteBatchNode *)batchNode;

//add all the labels to the layer to display them
-(void) displayAllLabels :(NSMutableArray *)labels layer:(CCLayer *)layer;

//align all labels passed in to the right
-(void) rightAlignLabels :(NSMutableArray *)labels;

//align all labels passed in to the left
-(void) leftAlignLabels :(NSMutableArray *)labels;


@end
