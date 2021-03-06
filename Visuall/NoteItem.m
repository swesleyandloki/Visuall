//
//  NoteView.m
//  Visuall
//
//  Created by Michael Tseng MacBook on 11/12/15.
//  Copyright © 2015 Visuall. All rights reserved.
//

#import "Note+CoreDataProperties.h"
#import "TransformUtil.h"
#import "AppDelegate.h"

@interface NoteItem()
@property NSManagedObjectContext *moc;
@end

#define NOTE_WIDTH 150.0f
#define NOTE_HEIGHT 50.0f

@implementation NoteItem

- (instancetype) initNote:(NSString *) title
                 andPoint:(CGPoint) point
                  andText:(NSString *) paragraph
{
    self = [super init];
    if (self) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        self.moc = appDelegate.managedObjectContext;
        
        Note *note = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:self.moc];
        note.title = title;
	note.paragraph = paragraph;
//        note.centerX = [NSNumber numberWithFloat:point.x];
//        note.centerY = [NSNumber numberWithFloat:point.y];
        [note setCenterPoint:point];
        [note setHeight:NOTE_HEIGHT andWidth:NOTE_WIDTH];
        [self setNote: note];
        [self setFrame: CGRectMake(- NOTE_WIDTH / 2,
                                   - NOTE_HEIGHT / 2,
                                   NOTE_WIDTH,
                                   NOTE_HEIGHT)];
        self.text = [NSString stringWithFormat: @"%@ %@", self.note.title, self.note.paragraph];
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        [[TransformUtil sharedManager] transformNoteItem: self];
        NSLog(@"Init %f, %f", self.note.centerX.floatValue, self.note.centerY.floatValue);
    }
    
    return self;
    
}

- (void) handlePan2: (UIPanGestureRecognizer *) gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan ||
        gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [gestureRecognizer setTranslation:CGPointZero inView:gestureRecognizer.view];
        [self translateTx:translation.x andTy:translation.y];
    }
}

- (void) saveToCoreData
{
    [self.moc save:nil];
}

- (void) translateTx: (float) tx andTy: (float) ty
{
    float xCenter = self.note.centerX.floatValue + tx;
    float yCenter = self.note.centerY.floatValue + ty;
    [self.note setCenterX:xCenter andCenterY:yCenter];
    
    [[TransformUtil sharedManager] transformNoteItem: self];
    
    NSLog(@"New note %f, %f", self.note.centerX.floatValue, self.note.centerY.floatValue);
}

@end
