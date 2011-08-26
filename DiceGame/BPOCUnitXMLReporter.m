//
//  BPOCUnitXMLReporter.m
//
//  Created by Jason Foreman on 10/24/09.
//
//  Copyright 2009 Jason Foreman. Some rights reserved.
//  This code is released under a Creative Commons license:
//  http://creativecommons.org/licenses/by-sa/3.0/
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>
#import "GDataXMLNode.h"

@interface BPTestXunitXmlListener : NSObject
{
@private
    GDataXMLDocument *document;
    GDataXMLElement *suitesElement;
    GDataXMLElement *currentSuiteElement;
    GDataXMLElement *currentCaseElement;
}

@property (retain) GDataXMLDocument *document;
@property (retain) GDataXMLElement *suitesElement;
@property (retain) GDataXMLElement *currentSuiteElement;
@property (retain) GDataXMLElement *currentCaseElement;

- (void)writeResultFile;

@end


static BPTestXunitXmlListener *instance = nil;

static void __attribute__ ((constructor)) BPTestXunitXmlListenerStart(void)
{
    instance = [BPTestXunitXmlListener new];
}

static void __attribute__ ((destructor)) BPTestXunitXmlListenerStop(void)
{
    [instance writeResultFile];
}


@implementation BPTestXunitXmlListener

@synthesize document;
@synthesize suitesElement;
@synthesize currentSuiteElement;
@synthesize currentCaseElement;


- (id)init;
{
    if ((self = [super init]))
    {
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(testSuiteStarted:) name:SenTestSuiteDidStartNotification object:nil];
        [center addObserver:self selector:@selector(testSuiteStopped:) name:SenTestSuiteDidStopNotification object:nil];
        [center addObserver:self selector:@selector(testCaseStarted:) name:SenTestCaseDidStartNotification object:nil];
        [center addObserver:self selector:@selector(testCaseStopped:) name:SenTestCaseDidStopNotification object:nil];
        [center addObserver:self selector:@selector(testCaseFailed:) name:SenTestCaseDidFailNotification object:nil];
        
        self.document = [[(GDataXMLDocument *) [GDataXMLDocument alloc] initWithRootElement:[GDataXMLElement elementWithName:@"testsuites"]] autorelease];
        self.suitesElement = self.document.rootElement;
    }
    return self;
}

- (void)dealloc;
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.document = nil;
    self.suitesElement = nil;
    self.currentSuiteElement = nil;
    self.currentCaseElement = nil;
    [super dealloc];
}

- (void)writeResultFile;
{
    if (self.document) {
        char *ocunitPathCString = getenv("BPOCUnitXMLReporterOut");
        NSString *ocunitPath;
        if (ocunitPathCString) {
            ocunitPath = [NSString stringWithCString:ocunitPathCString
                                            encoding:NSUTF8StringEncoding];
        } else {
            ocunitPath = @"ocunit.xml";
        }
        [[self.document XMLData] writeToFile:ocunitPath atomically:NO];
    }
}


#pragma mark Notification Callbacks

- (void)testSuiteStarted:(NSNotification*)notification;
{
    SenTest *test = [notification test];
    self.currentSuiteElement = [GDataXMLElement elementWithName:@"testsuite"];
    [self.currentSuiteElement addAttribute:[GDataXMLNode attributeWithName:@"name" stringValue:[test name]]];
}

- (void)testSuiteStopped:(NSNotification*)notification;
{
    if (self.currentSuiteElement)
    {
        [self.suitesElement addChild:self.currentSuiteElement];
        self.currentSuiteElement = nil;
    }
}

- (void)testCaseStarted:(NSNotification*)notification;
{
    SenTest *test = [notification test];
    self.currentCaseElement = [GDataXMLElement elementWithName:@"testcase"];
    [self.currentCaseElement addAttribute:[GDataXMLNode attributeWithName:@"name" stringValue:[test name]]];
}

- (void)testCaseStopped:(NSNotification*)notification;
{
    [self.currentSuiteElement addChild:self.currentCaseElement];
    self.currentCaseElement = nil;
}

- (void)testCaseFailed:(NSNotification*)notification;
{
    GDataXMLElement *failureElement = [GDataXMLElement elementWithName:@"failure"];
    [failureElement setStringValue:[[notification exception] description]];
    [self.currentCaseElement addChild:failureElement];
}

@end
