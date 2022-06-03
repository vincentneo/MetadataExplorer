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
    
    func retrieve() -> [Metadata]? {
        guard let metadata = NSMetadataItem(url: self.url) else { return nil }
        guard let values = metadata.values(forAttributes: metadata.attributes) else { return nil }
        
        var metadatas = [Metadata]()
        
        for (key, value) in values {
            print("\nKey \(key)")
            print("------")
            print("Value Type: \(type(of: value))")
            print("Value: \(value)\n")
            switch value {
            case is String:
                metadatas.append(Metadata(key: key, values: [value as! String]))
            case is [String]:
                metadatas.append(Metadata(key: key, values: value as! [String]))
            default:
                let stringify = String(describing: value)
                metadatas.append(Metadata(key: key, values: [stringify]))
            }
        }
        return metadatas
    }
}
