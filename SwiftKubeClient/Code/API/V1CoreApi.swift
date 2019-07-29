//
//  V1CoreApi.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

class V1CoreApi: Api {
    
    override func getService() -> String {
        return "api/v1";
    }
    
    func listPods(namespace: NSString, labelSelector: NSString?) throws -> Array<V1Pod> {
        
        var pods: Array<V1Pod> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + (namespace as String) + "/pods";
        if (labelSelector != nil) {
            urlAsString += "?labelSelector=" + (labelSelector! as String);
        }
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let pod = V1Pod(data: item);
            pods.append(pod);
        }
        
        return pods;
    }
    
    func listReplicationControllers(namespace: NSString, labelSelector: NSString?) throws -> Array<V1ReplicationController> {
        
        var rcs: Array<V1ReplicationController> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + (namespace as String) + "/replicationcontrollers";
        if (labelSelector != nil) {
            urlAsString += "?labelSelector=" + (labelSelector! as String);
        }
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let rc = V1ReplicationController(data: item);
            rcs.append(rc);
        }
        
        return rcs;
    }
    
    func listConfigMaps(namespace: NSString) throws -> Array<V1ConfigMap> {
        
        var cms: Array<V1ConfigMap> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + (namespace as String) + "/configmaps";
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let cm = V1ConfigMap(data: item);
            cms.append(cm);
        }
        
        return cms;
    }
    
    func listServices(namespace: NSString, labelSelector: NSString?) throws -> Array<V1Service> {
        
        var services: Array<V1Service> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + (namespace as String) + "/services";
        if (labelSelector != nil) {
            urlAsString += "?labelSelector=" + (labelSelector! as String);
        }
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let service = V1Service(data: item);
            services.append(service);
        }
        
        return services;
    }
}
