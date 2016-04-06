//
//  MediaTests.m
//  
//
//  Created by Daniel Rodas on 4/6/16.
//
//

#import <XCTest/XCTest.h>
#import "Media.h"
#import "User.h"
#import "Comment.h"

@interface MediaTests : XCTestCase
//NSDictionary *user
@end

static NSDictionary *sampleUser = nil;

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    sampleUser = @{@"id": @"6105892",
                   @"username": @"this1guy",
                   @"full_name": @"This One Guy",
                   @"profile_picture": @"http://www.fakepic.com"};
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *someComment = @{@"id": @"123456789",
                                  @"text": @"wow sick pic",
                                  @"from": sampleUser};
    
    
    NSDictionary *mediaDictionary = @{@"id": @"838921",
                                      @"url": @"www.testmedia.com",
                                      @"caption": @{@"wow look at this": @"this is neat"},
                                      @"comments": @{@"data": @[someComment]},
                                      @"user_has_liked": @"YES",};
    
    Media *testMedia = [[Media alloc] initWithDictionary:mediaDictionary];
    
    
    XCTAssertEqualObjects(testMedia.idNumber, mediaDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, [NSURL URLWithString:mediaDictionary[@"mediaURL"]], @"The picture URL shoudld be equal")
    
    ;
    XCTAssertEqualObjects(testMedia.caption, mediaDictionary[@"caption"][@"text"], @"The caption should be equal");
    XCTAssertEqualObjects(@(testMedia.comments.count), @(1), @"There is only one comment");
    Comment *firstComment = testMedia.comments[0];
    XCTAssertEqualObjects(firstComment.idNumber, mediaDictionary[@"comments"][@"data"][0][@"id"], @"The ID's should be equal");
    XCTAssertEqualObjects(firstComment.text, mediaDictionary[@"comments"][@"data"][0][@"text"], @"The text should be equal");
    User *firstUser = firstComment.from;
    XCTAssertEqualObjects(firstUser.fullName, mediaDictionary[@"comments"][@"data"][0][@"from"][@"full_name"], @"The user should be equal");
    
}

- (void) testComposeCommentView
{
    
}

- (void) testMediaTableViewHeight {
    
}



@end