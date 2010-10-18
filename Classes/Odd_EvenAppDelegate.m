//
//  Odd_EvenAppDelegate.m
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Odd_EvenAppDelegate.h"
#import "Odd_EvenViewController.h"
#import "AccelerometerSimulation.h"

// Constant for the number of times per second (Hertz) to sample acceleration.
#define kAccelerometerFrequency     40

@implementation Odd_EvenAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
  
  // Configure and start the accelerometer
  [[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / kAccelerometerFrequency)];
  [[UIAccelerometer sharedAccelerometer] setDelegate:self];  
}

// UIAccelerometerDelegate method, called when the device accelerates.
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
  // Update the accelerometer graph view
  [viewController updateHistoryWithX:acceleration.x Y:acceleration.y Z:acceleration.z Time:acceleration.timestamp];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
