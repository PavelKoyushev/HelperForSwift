//
//  Bundle+Extensions.swift
//
//
//  Created by Pavel Koyushev on 14.11.2023.
//

import Foundation

public extension Bundle {
    
    var identifier: String {
        guard let info = Bundle.main.infoDictionary,
              let identifier = info["CFBundleIdentifier"] as? String else { return "" }

        return identifier
    }
    
    var currentVersion: String {
        guard let info = Bundle.main.infoDictionary,
              let currentVersion = info["CFBundleShortVersionString"] as? String else { return "" }

        return currentVersion
    }
    
    var currentBuildNumber: String {
        guard let info = Bundle.main.infoDictionary,
              let currentBuildNumber = info["CFBundleVersion"] as? String else { return "" }

        return currentBuildNumber
    }
}
