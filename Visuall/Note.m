//
//  Note.m
//  Visuall
//
//  Created by John Mai on 11/20/15.
//  Copyright © 2015 Visuall. All rights reserved.
//

#import "Note.h"
#import "AppDelegate.h"
#import <UIKit/UIKit.h>

@implementation Note

//- (instancetype) initWithString: (NSString *)text {
//    return [self initWithString:text centerX:0 centerY:0];
//}
//
//- (instancetype) initWithString: (NSString *)text centerX: (float)pointX centerY: (float)pointY
//{
//    if (self = [super initWithEntity:[NSEntityDescription entityForName:@"Note" inManagedObjectContext: [Note getMOC]]  insertIntoManagedObjectContext: [Note getMOC]]) {
//        [NSEntityDescription ]
//        
//        self.paragraph = text;
//        self.centerX = [NSNumber numberWithFloat: pointX];
//        self.centerY = [NSNumber numberWithFloat: pointY];
//    }
//    
//    return self;
//}

//- (void) centerPoint: (CGPoint)point
//{
//    self.centerX = [NSNumber numberWithFloat:point.x];
//    self.centerY = [NSNumber numberWithFloat:point.y];
//}
//    
//- (void) setCenterX:(float)pointX CenterY:(float)pointY
//{
//    self.centerX = [NSNumber numberWithFloat:pointX];
//    self.centerY = [NSNumber numberWithFloat:pointY];
//}

+ (NSManagedObjectContext *) getMOC {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
}
@end
