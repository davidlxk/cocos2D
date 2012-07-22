//
//  DisplayHelper.m
//  Small
//
//  Created by David Lin on 12/07/11.
//  Copyright (c) 2012 WhiteSponge. All rights reserved.
//

#import "DisplayHelper.h"

@implementation DisplayHelper

//add all the sprites to the batch node to display them
-(void) displayAllSprites :(NSMutableArray *)sprites batchNode:(CCSpriteBatchNode *)batchNode {
    
    CCSprite *item;
    CCArray *ccItems = [CCArray arrayWithNSArray:sprites];
    
    CCARRAY_FOREACH(ccItems, item) { [batchNode addChild:item]; }
}

//add all the labels to the layer to display them
-(void) displayAllLabels :(NSMutableArray *)labels layer:(CCLayer *)layer {
    CCLabelTTF *item;
    CCArray *ccItems = [CCArray arrayWithNSArray:labels];
    
    CCARRAY_FOREACH(ccItems, item) { [layer addChild:item]; }
}

//align all labels passed in to the right
-(void) rightAlignLabels :(NSMutableArray *)labels {
    CCLabelTTF *item;
    CCArray *ccItems = [CCArray arrayWithNSArray:labels];
    
    CCARRAY_FOREACH(ccItems, item) { item.anchorPoint = ccp(1,0); }
}

//align all labels passed in to the left
-(void) leftAlignLabels :(NSMutableArray *)labels {
    CCLabelTTF *item;
    CCArray *ccItems = [CCArray arrayWithNSArray:labels];
    
    CCARRAY_FOREACH(ccItems, item) { item.anchorPoint = ccp(0,1); }
}


@end
