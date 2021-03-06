//
//  NotesCollection.m
//  Visuall
//
//  Created by Michael Tseng MacBook on 11/10/15.
//  Copyright © 2015 Visuall. All rights reserved.
//

#import "NotesCollection.h"
#import "Note+CoreDataProperties.h"
#import "NoteItem.h"

@interface NotesCollection () <UIGestureRecognizerDelegate>
@end


@implementation NotesCollection


- (void) initializeNotes
{
    self.Notes = [[NSMutableArray alloc] init];
    NoteItem *ni = [[NoteItem alloc] initNote:@"Hello World 0" andPoint:(CGPoint){ 150, 150 } andText:@""];
    NoteItem *ni2 = [[NoteItem alloc] initNote:@"Hello World 1" andPoint:(CGPoint){ 200, 300 } andText:@""];
    [self.Notes addObject:ni];
    [self.Notes addObject:ni2];
}

//method to add single note dynamically from main view
- (void) addNote:(NoteItem *)newNote
{
    [self.Notes addObject:newNote];
}



@end
