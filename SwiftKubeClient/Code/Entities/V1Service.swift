//
//  V1Service.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

class V1Service: NSObject {

    var labels: Array<String> = Array();
    var name: String = "";
    var status: Status = Status.Stopped;
    
    private override init() {
        
    }
    
    init(data: Dictionary<String,Any>) {
        
        let metadata = data["metadata"] as? Dictionary<String,Any>;
        let podName = metadata!["name"] as? String;
        
        let status = data["status"] as? Dictionary<String,Any>;
        let podPhase = status!["phase"] as? String;
        self.name = podName ?? "";
        self.status = Status(rawValue: (podPhase ?? "Unknown"))!;
    }
}
