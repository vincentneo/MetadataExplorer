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
        LazyVStack {
            ForEach(store.data) { item in
                Cell(item: item)
            }
        }
        .frame(minHeight: 200)
    }
}

struct Cell: View {
    let item: Metadata
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack {
                Text(item.readableName)
                Spacer()
            }
            VStack {
                ForEach(item.values, id: \.self) { value in
                    Text(value)
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
