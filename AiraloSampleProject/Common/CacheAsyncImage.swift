//
//  CacheAsyncImage.swift
//  AiraloSampleProject
//
//  Created by zombie zyomka on 10.12.2022.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let url, let cachedImage = ImageCache[url] {
            content(.success(cachedImage))
        } else {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    
    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if let url, case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(
            url: URL(string: "https://cdn.airalo.com/images/e41590e5-1299-4eaa-a62b-32e34a40b689.png")!
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
            case .failure(let error):
                ErrorView(error: error)
            @unknown default:
                Image(systemName: "exclamationmark")
            }
        }
    }
}

fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
