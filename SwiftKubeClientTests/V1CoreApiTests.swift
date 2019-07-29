//
//  V1CoreApiTests.swift
//  SwiftKubeClientTests
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import XCTest
@testable import SwiftKubeClient

class V1CoreApiTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config: K8SConfig = K8SConfig(host: "<KUBE_API_ADDRES>", portNumber: 80);
        K8SClient.sharedInstance = K8SClient(config: config);
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListPods() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let v1CoreApi: V1CoreApi = V1CoreApi();
        
        let pods: Array<V1Pod>?;
        
        do {
            pods = try v1CoreApi.listPods(namespace: "default", labelSelector: "app=abo-api-geolives-deploy");
            print("We got \(pods!.count) pods!");
            assert(pods!.count > 0);
        } catch {
            print("Error: \(error)");
            assertionFailure(error.localizedDescription);
        }
    }
    
    func testListReplicationControllers() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let v1CoreApi: V1CoreApi = V1CoreApi();
        
        let rcs: Array<V1ReplicationController>?;
        
        do {
            rcs = try v1CoreApi.listReplicationControllers(namespace: "default", labelSelector: nil);
            print("We got \(rcs!.count) replication controllers!");
            assert(rcs!.count > 0);
        } catch {
            print("Error: \(error)");
            assertionFailure(error.localizedDescription);
        }
    }
    
    func testListConfigMaps() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let v1CoreApi: V1CoreApi = V1CoreApi();
        
        let cms: Array<V1ConfigMap>?;
        
        do {
            cms = try v1CoreApi.listConfigMaps(namespace: "default");
            print("We got \(cms!.count) config maps!");
            assert(cms!.count > 0);
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
