//
//  K8SClient.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

@objc public class K8SClient: NSObject {
    
    @objc public static var sharedInstance: K8SClient = K8SClient();
    
    let config: K8SConfig;
    
    @objc public static func fromConfig(config: K8SConfig) -> K8SClient {
        let client: K8SClient = K8SClient(config: config);
        return client;
    }
    
    private override init() {
        self.config = K8SConfig.fromFile(file: NSURL(fileURLWithPath: "config.kube"));
    }
    
    @objc public init(config: K8SConfig) {
        self.config = config;
    }

}
