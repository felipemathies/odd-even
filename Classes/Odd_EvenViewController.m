//
//  Odd_EvenViewController.m
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Odd_EvenViewController.h"

@implementation Odd_EvenViewController

@synthesize playedNumber;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)updateHistoryWithX:(float)x Y:(float)y Z:(float)z Time:(NSTimeInterval)time {  
  history[nextIndex][0] = x;
  history[nextIndex][1] = y;
  history[nextIndex][2] = z;
  
  if (fabs(time - updateTime) > 1 && z < -1 && (z - history[nextIndex - 15][2]) < -0.5){
    updateTime = time;
    [self beginPlay];
  }
  
  // Advance buffer pointer to next position or reset to zero.
  nextIndex = (nextIndex + 1) % kHistorySize;
}

- (IBAction)play:(id)sender{
  [self beginPlay];
}

-(void)beginPlay{
  [gameModel play];
  
  pcNumberLabel.text = @"PC Number:";
  pcOddEvenLabel.text = @"PC Status:";
  
  pcNumber.text = [NSString stringWithFormat:@"%d", [gameModel getPcPlayedNumer]];
  pcOddEven.text = [gameModel getPcOdd];
  
  result.text = [gameModel getGameResult];
  sum.text = [NSString stringWithFormat:@"%d + %d = %d - %@", [gameModel getPlayedNumer], [gameModel getPcPlayedNumer], [gameModel getSum], [gameModel getGameOdd]];
}

- (IBAction)numbersSegmentAction:(id)sender {
  [gameModel setPlayedNumer:[playedNumber selectedSegmentIndex]];
}

- (IBAction)oddEvenSegmentAction:(id)sender {
  if ([oddEven selectedSegmentIndex] == 0)
    [gameModel setOdd:true];
  else
    [gameModel setOdd:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
    [super dealloc];
}

@end
