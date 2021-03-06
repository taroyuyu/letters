/*
 * MailCore
 *
 * Copyright (C) 2007 - Matt Ronge
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the MailCore project nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#import "LBBareMessageTests.h"


@implementation LBBareMessageTests
- (void)testEquals {
	LBBareMessage *msg1 = [[LBBareMessage alloc] init];
	msg1.uid = @"11111-11111";
	msg1.flags = 2;
	LBBareMessage *msg2 = [[LBBareMessage alloc] init];
	msg2.uid = @"11111-11111";
	msg2.flags = 2;	
	GHAssertTrue([msg1 isEqual:msg2], @"LBBareMessage should have been equal!");
	[msg1 release];
	[msg2 release];
}

- (void)testNotEqual {
	LBBareMessage *msg1 = [[LBBareMessage alloc] init];
	msg1.uid = @"11111-11111";
	msg1.flags = 3;
	LBBareMessage *msg2 = [[LBBareMessage alloc] init];
	msg2.uid = @"11111-11111";
	msg2.flags = 2;	
	GHAssertFalse([msg1 isEqual:msg2], @"LBBareMessage should have been not equal!");
	msg1.flags = 2;
	msg2.uid = @"";
	GHAssertFalse([msg1 isEqual:msg2], @"LBBareMessage should have been not equal!");
	[msg1 release];
	[msg2 release];
}

- (void)testHash {
	LBBareMessage *msg1 = [[LBBareMessage alloc] init];
	msg1.uid = @"11111-11111";
	msg1.flags = 2;
	LBBareMessage *msg2 = [[LBBareMessage alloc] init];
	msg2.uid = @"11111-11111";
	msg2.flags = 2;
	GHAssertTrue([msg1 hash] == [msg2 hash], @"LBBareMessage hashes should have been equal!");
	[msg1 release];
	[msg2 release];
}
@end
