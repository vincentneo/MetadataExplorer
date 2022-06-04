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
                        Cell(item: item)
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
