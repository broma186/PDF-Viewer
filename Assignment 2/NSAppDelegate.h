//
//  NSAppDelegate.h
//  Assignment 2
//
//  Matthew Brooker
//  541670
//
//  Created by Matthew Brooker on 9/23/14.
//  Copyright (c) 2014 Matthew Brooker. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

extern NSMutableArray *Docs;
extern PDFDocument *doc;
extern NSInteger count;

@interface NSAppDelegate : NSObject <NSApplicationDelegate>{
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet PDFView *pdfView;

@property (assign) IBOutlet NSWindow *aboutWindow;

// For note display
@property (assign) IBOutlet NSWindow *notesWindow;

@property (weak) IBOutlet NSTextField *jumpTextField;
@property (weak) IBOutlet NSButton *goButton;

@property (weak) IBOutlet NSButton *nextPageButton;
@property (weak) IBOutlet NSButton *previousPageButton;

@property (weak) IBOutlet NSButton *backButton;
@property (weak) IBOutlet NSButton *forwardButton;

@property (weak) IBOutlet NSButton *nextDocButton;
@property (weak) IBOutlet NSButton *prevDocButton;

// Zooming outlets
@property (weak) IBOutlet NSButton *zoomInButton;
@property (weak) IBOutlet NSButton *zoomOutButton;
@property (weak) IBOutlet NSButton *fitButton;

//  Outlet of particular page.
@property (weak) IBOutlet PDFPage *page;

@property (weak) IBOutlet PDFThumbnailView *pageScroller;

// For note storage.
@property (weak) IBOutlet NSButton *showNotesButton;
@property (weak) IBOutlet NSTextField *notesTextField;
@property (strong) NSMutableArray *pdfNotesArray;


// page navigation
- (IBAction)nextPage:(id)sender;
- (IBAction)previousPage:(id)sender;
- (IBAction)jumpToPage:(id)sender;
- (IBAction)goBack:(id)sender;
- (IBAction)goForward:(id)sender;

// Menu utility.
- (IBAction)openPDF:(id)sender;

// Doc naviagtion.
- (IBAction)nextDocument:(id)sender;
- (IBAction)previousDocument:(id)sender;

// Zooming features.
- (IBAction)zoomIn:(id)sender;
- (IBAction)zoomOut:(id)sender;
- (IBAction)zoomToFit:(id)sender;

// Display the about menu panel using window.
- (IBAction)displayAboutInfo:(id)sender;

// Display locally stored PDF notes using window.
- (IBAction)displayNotes:(id)sender;


@end
