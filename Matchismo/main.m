//
//  main.m
//  test1
//
//  Created by Eliah Ninyo on 03/05/2022.
//

#import <UIKit/UIKit.h>
#import "CardGameAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([CardGameAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
