//
//  SwiftKubeClientTests.swift
//  SwiftKubeClientTests
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import XCTest
@testable import SwiftKubeClient

class K8SClientTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSharedInstanceClient() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Setup shared instance client.
        let config: K8SConfig = K8SConfig(host: "<KUBE_API_ADDRES>", portNumber: 80);
        K8SClient.sharedInstance = K8SClient(config: config);
        
        let v1CoreApi: V1CoreApi = V1CoreApi();
        
        do {
            let pods: Array<V1Pod> = try v1CoreApi.listPods(namespace: "default", labelSelector: nil);
            print("Result: %s", pods);
        } catch {
            print("Error: \(error)");
        }
    }
    
    func testSpecificInstanceClient() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let config: K8SConfig = K8SConfig(host: "<KUBE_API_ADDRES>", portNumber: 80);
        let client: K8SClient = K8SClient(config: config);
        
        let v1CoreApi: V1CoreApi = V1CoreApi(client: client);
        //assert(v1CoreApi.getCode() == 1);
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
