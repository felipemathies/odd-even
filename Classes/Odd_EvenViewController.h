//
//  Odd_EvenViewController.h
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

// Constant for the number of acceleration samples kept in history.
#define kHistorySize 150

@interface Odd_EvenViewController : UIViewController {
  IBOutlet UISegmentedControl *oddEven;
  IBOutlet UISegmentedControl *playedNumber;
  
  IBOutlet UILabel *pcNumber;
  IBOutlet UILabel *pcOddEven;
  IBOutlet UILabel *result;
  IBOutlet UILabel *sum;
  
  IBOutlet UILabel *pcNumberLabel;
  IBOutlet UILabel *pcOddEvenLabel;
  
  IBOutlet GameModel *gameModel;
  
  UIAccelerationValue acceleration[3];
  // Two dimensional array of acceleration data.
  UIAccelerationValue history[kHistorySize][3];
  NSUInteger nextIndex;
  
  // when was the display last updated
	CFAbsoluteTime updateTime;
}

@property (nonatomic, retain) UISegmentedControl *playedNumber;

- (IBAction)play:(id)sender;
- (IBAction)numbersSegmentAction:(id)sender;
- (IBAction)oddEvenSegmentAction:(id)sender;

-(void)beginPlay;

// Add a sample of acceleration data to the history.
- (void)updateHistoryWithX:(float)x Y:(float)y Z:(float)z Time:(NSTimeInterval)time;

@end

