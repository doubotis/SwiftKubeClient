//
//  V1ConfigMap.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

class V1ConfigMap: NSObject {

    var name: String = "";
    
    private override init() {
        
    }
    
    init(data: Dictionary<String,Any>) {
        
        let metadata = data["metadata"] as? Dictionary<String,Any>;
        let mcName = metadata!["name"] as? String;
        
        self.name = mcName ?? "";
    }
}
