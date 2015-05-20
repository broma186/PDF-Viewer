//
//  NSAppDelegate.m
//  Assignment 2
//
//  Matthew Brooker
//  541670
//
//  Created by Matthew Brooker on 9/23/14.
//  Copyright (c) 2014 Matthew Brooker. All rights reserved.
//
#import "NSAppDelegate.h"

// Global array full of the documents added using open menu feature.
NSMutableArray *Docs;

// Particular document used for allocation
PDFDocument *doc;

// Global count used for document manipulation
NSInteger count = 0;

@implementation NSAppDelegate

@synthesize window = _window;
@synthesize aboutWindow = _aboutWindow;
@synthesize pdfView = _pdfview;
@synthesize jumpTextField = _jumpTextField;
@synthesize pdfNotesArray = _pdfNotesArray;
@synthesize notesTextField = _notesTextField;
@synthesize notesWindow = _notesWindow;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Open initial startup page.
    PDFDocument *pdfDoc;
    // Needs to be set to the start up page depending where it is on the computer.
    NSURL *url = [NSURL fileURLWithPath:@"/Users/Matt/Documents/Assignment 2/startup_page.pdf"];
    pdfDoc = [[PDFDocument alloc] initWithURL:url];
    [_pdfview setDocument:pdfDoc];
    
    // For displaying the name of the document.
    NSString *fileName = [[pdfDoc documentURL] lastPathComponent];
    [_window setTitle: fileName];
    
    // Set initial document to an appropriate fit.
    if ([_pdfview autoScales] != YES) {
        [_pdfview setAutoScales:YES];
    }
    _pdfNotesArray = [[NSMutableArray alloc] init];
}

// Allows user to use the program menu to open a pdf of their choosing.

- (IBAction)openPDF:(id)sender {
    
    
    
    NSOpenPanel* open = [NSOpenPanel openPanel];
    
    [open setFloatingPanel:YES];
    [open setCanChooseDirectories:NO];
    [open setCanChooseFiles:YES];
    [open setAllowedFileTypes:[[NSArray alloc] initWithObjects:@"pdf", @"PDF", nil]];
    [open setAllowsMultipleSelection:YES];
    [open runModal];
  
    // If there is a document or more.
    if ([Docs count] > 0){
    
    // For every URL chosen in the menu by user, add to the Document
    // array a document representing each URL
    for (NSURL *url in [open URLs]) {
        [Docs addObject:  doc = [[PDFDocument alloc] initWithURL: url]];
    }
    }
    // if there are no opened documents (besides the startup page),
    // allocate the document array before displaying first document.
    else {
        
        Docs = [[NSMutableArray alloc] init];
        
        for (NSURL *url in [open URLs]) {
            [Docs addObject: doc = [[PDFDocument alloc] initWithURL: url]];
        }
    }
    // Display first document that was selected in the open menu.
    [_pdfview setDocument: Docs[count]];
    
    // For displaying the name of the document.
    NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
    [_window setTitle: fileName];
    
}

// Navigate to the next document.

- (IBAction)nextDocument:(id)sender {
   
    if ([Docs count] > 1){
        
        // Records the notes taken before the increment to the next document.
        _pdfNotesArray[count] = [_notesTextField stringValue];
        [_notesTextField setStringValue:@""];
        
    count++;
    if (count < [Docs count]){
        [_pdfview setDocument:Docs[count]];
        
    // For displaying the name of the document.
        NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
        [_window setTitle: fileName];
        
        // Set the title of the notes window.
        NSString *fName = [[Docs[count] documentURL] lastPathComponent];
        NSString *noteTitle = @"notes";
        NSString *title = [NSString stringWithFormat:@"%@ %@", fName, noteTitle];
        [_notesWindow setTitle: title];
        
        // Set notes.
        if ([_pdfNotesArray[count] isEqual:nil]) {
            
            [_notesTextField setStringValue:@""];
        }else {
            [_notesTextField setStringValue:_pdfNotesArray[count]];
            
        }
    }
    else {
        count = 0;
        [_pdfview setDocument:Docs[count]];
        
    // For displaying the name of the document.
        NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
        [_window setTitle: fileName];
        
        // Set the title of the notes window.
        NSString *fName = [[Docs[count] documentURL] lastPathComponent];
        NSString *noteTitle = @"notes";
        NSString *title = [NSString stringWithFormat:@"%@ %@", fName, noteTitle];
        [_notesWindow setTitle: title];
        
        
        if ([_pdfNotesArray[count] isEqual:nil]) {
            
            [_notesTextField setStringValue:@""];
        }else {
            [_notesTextField setStringValue:_pdfNotesArray[count]];
            
        }
    }
        
      
       
    }
}

// Navigate to the previous document.

- (IBAction)previousDocument:(id)sender {
    
    if ([Docs count] > 1){
        
      //  _pdfNotesArray[count] = [_notesTextField stringValue];
      //  [_notesTextField setStringValue:@""];
   
        count--;
      
     if (count >= 0){
         
         [_pdfview setDocument:Docs[count]];
         
    // For displaying the name of the document.
         NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
         [_window setTitle: fileName];
         
         // Set the title of the notes window.
         NSString *fName = [[Docs[count] documentURL] lastPathComponent];
         NSString *noteTitle = @"notes";
         NSString *title = [NSString stringWithFormat:@"%@ %@", fName, noteTitle];
         [_notesWindow setTitle: title];
         
         
         if ([_pdfNotesArray[count] isEqual:nil]) {
             
             [_notesTextField setStringValue:@""];
         }else {
             [_notesTextField setStringValue:_pdfNotesArray[count]];
             
         }
    }
    else {
        count = [Docs count] - 1;
        [_pdfview setDocument:Docs[count]];
        
    // For displaying the name of the document.
        NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
        [_window setTitle: fileName];
        
        // Set the title of the notes window.
        NSString *fName = [[Docs[count] documentURL] lastPathComponent];
        NSString *noteTitle = @"notes";
        NSString *title = [NSString stringWithFormat:@"%@ %@", fName, noteTitle];
        [_notesWindow setTitle: title];
        
        
        if ([_pdfNotesArray[count] isEqual:nil]) {
            
            [_notesTextField setStringValue:@""];
        }else {
            [_notesTextField setStringValue:_pdfNotesArray[count]];
            
        }
    }
        
     
        
 }
}

// Zoom in to the PDF window.

- (IBAction)zoomIn:(id)sender {
    if ([_pdfview canZoomIn] == YES){
    [_pdfview zoomIn: sender];
    }
    else {
        NSLog(@"Can't zoom in any further");
    }
}

// Zoom out in the PDF window.

- (IBAction)zoomOut:(id)sender {
    if ([_pdfview canZoomOut] == YES){
    [_pdfview zoomOut: sender];
    }
    else {
        NSLog(@"Can't zoom out any further");

    }
}

// Zoom in/out to fit the window.

- (IBAction)zoomToFit:(id)sender {
    if ([_pdfview scaleFactor] != 1.0){
    [_pdfview setScaleFactor: 1.0];
    }
    else {
        NSLog(@"The PDF document already fits the window");
    }
}

// Show about window.
- (IBAction)displayAboutInfo:(id)sender {
     [_aboutWindow makeKeyAndOrderFront:self];
     [_aboutWindow setTitle:@"About"];
}

// For note storage relative to each document.
- (IBAction)displayNotes:(id)sender {
    [_notesWindow makeKeyAndOrderFront:self];
    
    // Set the title.
    NSString *fileName = [[Docs[count] documentURL] lastPathComponent];
    NSString *noteTitle = @"notes";
    NSString *title = [NSString stringWithFormat:@"%@ %@", fileName, noteTitle];
    [_notesWindow setTitle: title];
    
    
    [_notesTextField setStringValue:[_notesTextField stringValue]];
   
}


// Go to the next page.

- (IBAction)nextPage:(id)sender {
    [_pdfview goToNextPage: sender];
}

// Go to the previous page.

- (IBAction)previousPage:(id)sender {
    [_pdfview goToPreviousPage: sender];
}

// Jump to a specified page.

- (IBAction)jumpToPage:(id)sender {
    
    NSInteger num = [_jumpTextField integerValue];
    
    PDFDocument *pdfDoc =  [[PDFDocument alloc] init];
    pdfDoc = [_pdfview document];
    
    PDFPage *page = [[PDFPage alloc] init];
    page = [pdfDoc pageAtIndex: num - 1];
    
    [_pdfview goToPage: page];

}

// Back to last page in document's memory

- (IBAction)goBack:(id)sender {
    [_pdfview goBack: sender];
}

// Forward to last page in document's memory

- (IBAction)goForward:(id)sender {
    [_pdfview goForward: sender];
}



@end
