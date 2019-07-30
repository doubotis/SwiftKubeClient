//
//  K8SConfigTests.swift
//  SwiftKubeClientTests
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import XCTest
@testable import SwiftKubeClient

class K8SConfigTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConfigInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let config = K8SConfig(host: TestConstants.HOST, portNumber: TestConstants.PORT_NUMBER);
        
        assert(config.host == TestsConstants.HOST);
        assert(config.portNumber == TestConstants.PORT_NUMBER);
    }
    
    func testConfigFromFile() {
        let url = URL(string: "file://kube.config")!;
        let config = K8SConfig.fromFile(file: url);
        
        assert(config.host == "");
        assert(config.portNumber == 0);
    }

}
