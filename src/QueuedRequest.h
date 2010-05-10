//
//  QueuedRequest.h
//  FBConnect
//
//  Created by Matthew Farnell on 5/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBRequest.h"


@interface QueuedRequest : NSOperation {
    NSURLRequest *request;
  //  NSString *downloadPath;
	FBRequest *fbRequest;
}

@property (nonatomic, retain) NSURLRequest *request;
@property (nonatomic, retain) FBRequest *fbRequest;
//@property (readonly, retain) NSString *downloadPath;

-(id)initWithRequest:(NSURLRequest *)theRequest:(FBRequest *)theFbRequest;

@end

