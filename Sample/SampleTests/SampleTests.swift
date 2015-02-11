//
//  SampleTests.swift
//  SampleTests
//
//  Created by yasuharu on 2015/02/11.
//  Copyright (c) 2015年 yanamura. All rights reserved.
//

import UIKit
import XCTest
import YNMNiceCatch

class SampleTests: XCTestCase {

    var isExceptionRaised = false

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNiceCatch() {
        YNMNiceCatch.niceCatch({
            () -> AnyObject! in
                NSException.raise("ex", format:"exception raised", arguments:getVaList([]))
                return nil
        })

        XCTAssert(true, "Pass")
    }

    func testExceptionNotification() {
        self.isExceptionRaised = false

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "exceptionRaised",
            name: YNM_EXCEPTION_NOTIFICATION,
            object: nil
        )

        YNMNiceCatch.exceptionNotification { () -> AnyObject! in
            NSException.raise("ex", format:"exception raised", arguments:getVaList([]))
            return nil;
        }

        XCTAssertTrue(self.isExceptionRaised);
    }

    //MARK: Helper Methods
    func exceptionRaised() {
        self.isExceptionRaised = true
    }
}
