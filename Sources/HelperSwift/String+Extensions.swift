//
//  String+Extensions.swift
//
//
//  Created by Pavel Koyushev on 16.11.2023.
//

import Foundation

public extension String {
    
    func getURLs() -> [URL] {
        var foundUrls = [URL]()
        
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return foundUrls
        }
        
        let matches = detector.matches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: self.utf16.count)
        )
        
        for match in matches {
            guard let range = Range(match.range, in: self),
                  let retrievedURL = URL(string: String(self[range])) else { continue }
            foundUrls.append(retrievedURL)
        }
        
        return foundUrls
    }
}
