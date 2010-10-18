//
//  GameModel.h
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GameModel : NSObject {
  int playedNumber;
  int pcPlayedNumber;
  int sum;
  BOOL odd;
  BOOL result;
}

- (void)play;
- (void)setOdd:(BOOL)status;
- (void)setPlayedNumer:(int)number;
- (int)getPlayedNumer;
- (int)getPcPlayedNumer;
- (int)getSum;
- (id)getOdd;
- (id)getPcOdd;
- (id)getGameResult;
- (id)getGameOdd;
@end
