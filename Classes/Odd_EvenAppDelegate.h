//
//  Odd_EvenAppDelegate.h
//  Odd-Even
//
//  Created by Felipe Mathies on 1/30/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Odd_EvenViewController;

@interface Odd_EvenAppDelegate : NSObject <UIAccelerometerDelegate> {
    UIWindow *window;
    Odd_EvenViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Odd_EvenViewController *viewController;

@end

