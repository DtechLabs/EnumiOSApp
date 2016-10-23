//
//  ListInstalledAPP.swift
//  EnumAPP
//
//  Created by Yuri Drigin on 20.10.16.
//  Copyright © 2016 Dtech Labs Ltd. All rights reserved.
//

import Foundation

class ListInstalledAPP {
    
    private var _LMWorkspace = LMWorkspace()
    private var installed = [LMApp]()
    
    static let shared = ListInstalledAPP()
    
    private init?() {
        installed.removeAll()
        
        guard let founded = _LMWorkspace.installedApplications as? [LMApp] else {
            return nil
        }
        
        for app in founded {
            if app.applicationType == "User" {
                installed.append(app)
            }
        }
        
        NotificationCenter.default.post(name: Notification.Name("listApdate"), object: nil)
    }
    
    var count: Int {
        return installed.count
    }
    
    subscript(index: Int) -> LMApp {
        return installed[index]
    }
    
}
