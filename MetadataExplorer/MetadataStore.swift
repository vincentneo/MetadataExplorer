//
//  MetadataStore.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import SwiftUI

class MetadataStore: ObservableObject {
    @Published var data = [Metadata]()
    
    func update(url: URL) {
        let data = MetadataRetrieval(url: url).retrieve()
        guard let data = data else { return }
        self.data = data
    }
}
