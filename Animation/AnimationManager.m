//
//  AnimationManager.m
//
//  Created by David Lin on 12/05/09.
//  Copyright (c) 2012 David Lin. All rights reserved.
//
 
#import "AnimationManager.h"
#import "cocos2d.h"
 
@implementation AnimationManager
 
-(id) init {
 
    if ((self = [super init])) {}
    return self;
}
 
//Blinks visual object
-(void) blink :(id)blinkObject :(float)duration {
 
    CCFadeIn *fadeIn = [CCFadeIn actionWithDuration:duration];
    CCFadeOut *fadeOut = [CCFadeOut actionWithDuration:duration];
    CCSequence *fade = [CCSequence actions:fadeOut,fadeIn, nil];
 
    [blinkObject runAction:[CCRepeatForever actionWithAction:fade]];
}
 
//pulsate an object that is passed in
-(void) pulsate :(id)pulsateObject :(float)scaleMax :(float)scaleMin {
    id scaleMaxAction =  [CCEaseInOut actionWithAction:
        [CCScaleTo actionWithDuration:0.8 scale:scaleMax] rate:2.0];
    id scaleMinAction = [CCEaseInOut actionWithAction:
        [CCScaleTo actionWithDuration:0.8 scale:scaleMin] rate:2.0];
    CCSequence *scaleSeq = [CCSequence actions:scaleMaxAction, scaleMinAction, nil];
    [pulsateObject runAction:[CCRepeatForever actionWithAction:scaleSeq]];
}
 
//creates a flash on the scene that is passed in
-(void) flash :(CCScene *)scene :(float)flashDuration {
 
    CCLayerColor *whiteLayer = [CCLayerColor layerWithColor:ccc4(255, 255, 255, 255) 
        width:480 height:320];
    [whiteLayer runAction:[CCHide action]];
    [scene addChild:whiteLayer];
 
    id fadeInAction = [CCFadeIn actionWithDuration:flashDuration];
    id fadeOutAction = [CCFadeOut actionWithDuration:flashDuration];
 
    CCCallBlock *removeWhiteLayer = [CCCallBlock actionWithBlock:^{ 
        [scene removeChild:whiteLayer cleanup:YES]; }];
    CCSequence *flashSeq = [CCSequence actions:[CCShow action],
        fadeInAction,fadeOutAction,removeWhiteLayer,nil];
 
    [whiteLayer runAction:flashSeq];
}
 
//creates a vibrating effect on the object passed in
-(void) vibrate :(CCNode *)vibrateObject {
 
    float randNum =  (arc4random() % (4 - 2)) + 2;
 
    CGPoint leftPoint = CGPointMake(vibrateObject.position.x - randNum,
        vibrateObject.position.y);
    CGPoint rightPoint = CGPointMake(vibrateObject.position.x + randNum,
        vibrateObject.position.y);
 
    CGPoint upPoint = CGPointMake(vibrateObject.position.x, 
        vibrateObject.position.y + randNum);
    CGPoint downPoint = CGPointMake(vibrateObject.position.x, 
        vibrateObject.position.y - randNum);
 
    id vibrateLeft = [CCMoveTo actionWithDuration:0.1 position:leftPoint];
    id vibrateRight = [CCMoveTo actionWithDuration:0.1 position:rightPoint];
 
    id vibrateUp = [CCMoveTo actionWithDuration:0.1 position:upPoint];
    id vibrateDown = [CCMoveTo actionWithDuration:0.1 position:downPoint];
 
    id vibrate = [CCSequence actions:vibrateLeft,vibrateRight,vibrateUp,vibrateDown,
        vibrateRight,vibrateUp,vibrateLeft,vibrateDown, nil];
 
    id repeatVibrate = [CCRepeatForever actionWithAction:vibrate];
 
    [vibrateObject runAction:repeatVibrate];
}