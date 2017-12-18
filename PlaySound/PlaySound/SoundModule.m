//
//  SoundModule.m
//
//  Created by Gheorghe Tomoiaga on 10/12/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "SoundModule.h"
#import <AudioToolbox/AudioToolbox.h>
#import "SoundManager.h"

@implementation SoundModule

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(playSound:(NSString *)soundPath)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    NSString *soundUrl = [[NSBundle mainBundle] pathForResource:soundPath ofType:@"mp3"];
    [[SoundManager sharedManager] playMusic:soundUrl looping:NO];
  });
}

@end
