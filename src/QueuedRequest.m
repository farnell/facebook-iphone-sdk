//
//  QueuedRequest.m
//  FBConnect
//
//  Created by Matthew Farnell on 5/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "QueuedRequest.h"
//#import 

@implementation QueuedRequest

@synthesize request;
@synthesize fbRequest;
//@synthesize downloadPath;

//-(id)initWithRequest:(NSURLRequest *)theRequest {
-(id)initWithRequest:(NSURLRequest *)theRequest:(FBRequest *)theFbRequest {	
    if ( self = [super init] ) {
		[self setRequest:theRequest];
		[self setFbRequest:theFbRequest];
        //self.url = newURL;
        //self.downloadPath = newDownloadPath;
    }
    return self;
}

-(void)main {
	
	NSHTTPURLResponse *response = nil;
	NSError *conError = nil;	
	//NSLog(@"QueuedRequest sendSynchronousRequest:%@", [[request URL] absoluteString]);
	NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&conError];	
	
	if (receivedData) {
        //NSLog(@"%s Error loading document (%@): %@", _cmd, [[self targetURL] absoluteString], error);
			//[self handleResponseData:_responseText];				
		//[fbRequest performSelectorOnMainThread:@selector(handleResponseData:) withObject:receivedData waitUntilDone:NO];		
		//[fbRequest performSelectorInBackground:@selector(handleResponseData:) withObject:receivedData];				
		[fbRequest performSelector:@selector(handleResponseData:) withObject:receivedData];						
		//NSLog(@"QueuedRequest Test");
    }
	else {
		//[self failWithError:error];
		//[fbRequest performSelectorInBackground:@selector(failWithError:) withObject:conError];				
		[fbRequest performSelector:@selector(failWithError:) withObject:conError];						
		//[fbRequest performSelectorOnMainThread:@selector(failWithError:) withObject:conError waitUntilDone:NO];						
	}	
  //  [[AppDelegate shared] performSelectorOnMainThread:@selector(pageLoaded:) withObject:document waitUntilDone:NO];
	
}


- (void)dealloc {
    self.request = nil;
	self.fbRequest = nil;
	[super dealloc];
}


@end
