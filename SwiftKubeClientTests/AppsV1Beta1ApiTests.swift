//
//  AppsV1Beta1ApiTests.swift
//  SwiftKubeClientTests
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import XCTest
@testable import SwiftKubeClient

class AppsV1Beta1ApiTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config: K8SConfig = K8SConfig(host: "<KUBE_API_ADDRES>", portNumber: 80);
        K8SClient.sharedInstance = K8SClient(config: config);
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListReplicationControllers() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let appsV1Beta1Api: AppsV1Beta1Api = AppsV1Beta1Api();
        
        let deployments: Array<AppsV1Beta1Deployment>?;
        
        do {
            deployments = try appsV1Beta1Api.listDeployments(namespace: "default", labelSelector: nil);
            print("We got \(deployments!.count) deployments!");
            assert(deployments!.count > 0);
        } catch {
            print("Error: \(error)");
            assertionFailure(error.localizedDescription);
        }
    }
    
    func testListStatfulSets() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let appsV1Beta1Api: AppsV1Beta1Api = AppsV1Beta1Api();
        
        let sss: Array<AppsV1Beta1StatefulSet>?;
        
        do {
            sss = try appsV1Beta1Api.listStatefulSets(namespace: "default", labelSelector: nil);
            print("We got \(sss!.count) stateful sets!");
            assert(sss!.count > 0);
        } catch {
            print("Error: \(error)");
            assertionFailure(error.localizedDescription);
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
