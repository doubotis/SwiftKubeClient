//
//  Api.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

@objc class Api: NSObject {
    private var _client: K8SClient;
    
    override init() {
        _client = K8SClient.sharedInstance;
    }
    
    init(client: K8SClient) {
        _client = client;
    }
    
    internal func getService() -> String {
        return "";
    }
    
    internal func prebuildURLFromClient() -> String {
        var text = "http://" + (_client.config.host as String) + ":" + String(_client.config.portNumber);
        text += "/" + getService();
        return text;
    }
    
    internal func queryURL(url: URL) throws -> Any {
        
        let data: Data = try Data(contentsOf: url);
        
        // Try to parse to JSON.
        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .allowFragments);
        return jsonResponse;
    }
}
