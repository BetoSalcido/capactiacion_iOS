//
//  ManagerProvider.swift
//  TrialApp
//
//  Created by Beto Salcido on 03/02/22.
//  Copyright © 2022 Etips. All rights reserved.
//

import Foundation

/// Conforms to this protocol to provide access to different managers.
protocol ManagerProvider {
    /// Manages APIs.
    var netWorkingManager: NetWorkingManager { get }
    
    var alertManager: AlertManager { get }
}

class AppManagerProvider: ManagerProvider {
    lazy var netWorkingManager: NetWorkingManager = {
        return NetWorkingManager()
    }()

    lazy var alertManager: AlertManager = {
        return AlertManager()
    }()
    
    
}
