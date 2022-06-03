//
//  MetadataExplorerApp.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import SwiftUI

@main
struct MetadataExplorerApp: App {
    @ObservedObject var store = MetadataStore()
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
                .onAppear {
                    DispatchQueue.main.async {
                        let openPanel = NSOpenPanel()
                        openPanel.canChooseFiles = true
                        openPanel.runModal()
                        if let url = openPanel.url {
                            store.update(url: url)
                        }
                    }
                }
        }
    }
}
