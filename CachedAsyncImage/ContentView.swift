//
//  ContentView.swift
//  CachedAsyncImage
//
//  Created by Thomas George on 28/01/2023.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @State private var randomNumber = 1

    let images = [
        "https://images.igdb.com/igdb/image/upload/t_1080p/eocdvaynboqmud9hmysu.jpg",
        "https://images.igdb.com/igdb/image/upload/t_1080p/balxsfafzeyy3ki3sc0z.jpg",
        "https://images.igdb.com/igdb/image/upload/t_1080p/ithhctwgt8rsxbxe5uy5.jpg",
        "https://images.igdb.com/igdb/image/upload/t_1080p/ixynqzoedwo8vc5nzqma.jpg",
        "https://images.igdb.com/igdb/image/upload/t_1080p/bz4asonezfuq945jg1qr.jpg"
    ]

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: images[randomNumber])) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity / 2)
            } placeholder: {
                ProgressView("Loading image")
            }

            WebImage(url: URL(string: images[randomNumber]))
                .onSuccess { image, data, cacheType in
                    print("==========")
                    print("Size : \(image.size)")
                    print("Data : \(data?.count)")
                    print("Cache Type : \(cacheType.rawValue)")
                }
                .resizable()
                .indicator(.progress)
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity / 2)

            Button {
                randomNumber = randomNumber == 4 ? 0 : randomNumber + 1
            } label: {
                Text("Change Image")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
