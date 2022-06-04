//
//  ContentCell.swift
//  MetadataExplorer
//
//  Created by Vincent Neo on 4/6/22.
//

import SwiftUI

struct Cell: View {
    let item: Metadata
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(item.readableName)
                    .font(.system(size: 20, weight: .bold, design: .default))
                Text(item.id)
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 4)
            .padding(.top, 8)
            
            WrappingHStack(models: item.values) { value in
                Text(value)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(.accentColor)
                    .fixedSize(horizontal: false, vertical: true)
                    .textSelection(.enabled)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(Color.accentColor, lineWidth: 2)
                    }
                    .padding(.vertical, 2)
            }
            
        }
        .padding()
        .background {
            ZStack {
                
                RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(colorScheme == .dark ? Color(white: 0.5) : Color(white: 0.95), lineWidth: 1)
            }
            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 4)
        }
        
        
        
    }

}


struct CellPreviews: PreviewProvider {
    static var previews: some View {
        Cell(item: Metadata(key: "kMDItemFSCreationDate", values: ["2022-06-04 09:48:54 +0000"]))
    }
}

