//
//  AnimationManager.h
//
//  Created by David Lin on 12/05/09.
//  Copyright (c) 2012 David Lin. All rights reserved.
//
 
#import <Foundation/Foundation.h>
#import "cocos2d.h"
 
@interface AnimationManager : NSObject {
 
}
 
//blinks an object that is passed in
-(void) blink :(id)blinkObject :(float)duration;
 
//pulsate an object that is passed in
-(void) pulsate :(id)pulsateObject :(float)scaleMax :(float)scaleMin;
 
//creates a flash on the screen
-(void) flash :(CCScene *)scene :(float)flashDuration;
 
//creates a vibrating effect on the object passed in
-(void) vibrate :(CCNode *)vibrateObject;