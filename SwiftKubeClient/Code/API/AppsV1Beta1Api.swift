//
//  AppsV1BetaApi.swift
//  SwiftKubeClient
//
//  Created by Christophe on 25/07/2019.
//  Copyright © 2019 Geolives. All rights reserved.
//

import UIKit

class AppsV1Beta1Api: Api {

    override func getService() -> String {
        return "apis/apps/v1beta1";
    }
    
    func listDeployments(namespace: String, labelSelector: String?) throws -> Array<AppsV1Beta1Deployment> {
        
        var deployments: Array<AppsV1Beta1Deployment> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + namespace + "/deployments";
        if (labelSelector != nil) {
            urlAsString += "?labelSelector=" + labelSelector!;
        }
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let depl = AppsV1Beta1Deployment(data: item);
            deployments.append(depl);
        }
        
        return deployments;
    }
    
    func listStatefulSets(namespace: String, labelSelector: String?) throws -> Array<AppsV1Beta1StatefulSet> {
        
        var sss: Array<AppsV1Beta1StatefulSet> = Array();
        
        var urlAsString: String = self.prebuildURLFromClient() + "/namespaces/" + namespace + "/statefulsets";
        if (labelSelector != nil) {
            urlAsString += "?labelSelector=" + labelSelector!;
        }
        print("URL built: %s", urlAsString);
        let url: URL = URL(string: urlAsString)!;
        
        let result: Any = try self.queryURL(url: url);
        
        let res: Dictionary<String,Any> = (result as? Dictionary<String,Any>)!;
        let items: Array<Dictionary<String,Any>> = res["items"] as! Array<Dictionary<String, Any>>;
        
        for anyItem in items {
            let item: Dictionary<String,Any> = (anyItem as? Dictionary<String,Any>)!;
            
            let ss = AppsV1Beta1StatefulSet(data: item);
            sss.append(ss);
        }
        
        return sss;
    }
}
