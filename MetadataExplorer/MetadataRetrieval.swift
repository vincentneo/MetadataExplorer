//
//  MetadataRetrieval.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import SwiftUI

class MetadataRetrieval {
    let url: URL
    init(url: URL) {
        self.url = url
    }
    
    func retrieve() {
        guard let metadata = NSMetadataItem(url: self.url) else { return }
        guard let values = metadata.values(forAttributes: metadata.attributes) else { return }
        for (key, value) in values {
            print("\nKey \(key)")
            print("------")
            print("Value Type: \(type(of: value))")
            print("Value: \(value)\n")
        }
    }
}
