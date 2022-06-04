//
//  Metadata.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import Foundation

struct Metadata: Identifiable, Hashable {
    let id: String // key
    let readableName: String
    let values: [String]
    
    init(key: String, values: [String]) {
        self.id = key
        // https://stackoverflow.com/a/7599674
        let splitedKey = key.split(usingRegex: #"(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|_"#).dropFirst(3)
        self.readableName = splitedKey.joined(separator: " ")
        self.values = values
    }
}
