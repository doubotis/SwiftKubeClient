//
//  K8SConfig.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

@objc public class K8SConfig: NSObject {

    let host: NSString;
    let portNumber: NSInteger;
    
    @objc public static func fromFile(file: NSURL) -> K8SConfig {
        let config: K8SConfig = K8SConfig(host: "", portNumber: 0);
        return config;
    }
    
    private override init() {
        self.host = "";
        self.portNumber = 0;
    }
    
    @objc public init(host: NSString, portNumber: NSInteger) {
        self.host = host;
        self.portNumber = portNumber;
    }
    
    
}
