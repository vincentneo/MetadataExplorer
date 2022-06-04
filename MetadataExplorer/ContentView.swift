//
//  ContentView.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: MetadataStore
    
    var body: some View {
        GeometryReader { geoProxy in
            ScrollView {
                LazyVStack {
                    Spacer()
                        .frame(height: 16)
                    ForEach(store.data) { item in
                        Button {
                            if let firstValue = item.values.first {
                                NSPasteboard.general.clearContents()
                                let contents = item.values.count > 1 ? item.values.joined(separator: ", ") : firstValue
                                NSPasteboard.general.setString("\(item.id): \(contents)",
                                                               forType: .string)
                            }
                        } label: {
                            Cell(item: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geoProxy.size.width * 0.9)

                    }
                    Spacer()
                        .frame(height: 16)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MetadataStore())
    }
}
