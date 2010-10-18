//
//  GameModel.m
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameModel.h"


@implementation GameModel

- (id)init{
  if ((self = [super init])) {
    odd = true;
    playedNumber = 0;
  }
  return self;
}

- (void)setPlayedNumer:(int)number{
  playedNumber = number;
}

- (void)setOdd:(BOOL)status{
  odd = status;
}

- (int)getPlayedNumer{
  return playedNumber;
}

- (int)getPcPlayedNumer{
  return pcPlayedNumber;
}

- (int)getSum{
  return sum;
}

- (id)getOdd{
  if (odd)
    return @"Odd";
  else
    return @"Even";
}

- (id)getPcOdd{
  if (odd)
    return @"Even";
  else
    return @"Odd";
}

- (id)getGameResult{
  if (result)
    return @"Winner!";
  else
    return @"Loser!";
}

-(id)getGameOdd{
  if ((sum % 2) == 0)
    return @"Odd";
  else
    return @"Even";
}

- (void)play{
  pcPlayedNumber = random() % 6;
  sum = pcPlayedNumber + playedNumber;
  
  int divisionResult = (sum % 2);
  
  result = false;
  if (divisionResult == 0 && odd)
    result = true;
  if (divisionResult != 0 && !odd)
    result = true;
}

- (void)dealloc {
  [super dealloc];
}
@end
