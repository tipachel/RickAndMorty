//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Tipachel on 30.03.2022.
//

import UIKit

class CharacterImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            image = #imageLiteral(resourceName: "150-1503945_transparent-user-png-default-user-image-png-png")
            return
        }
        
        if let cachedImage = getCachedImage(from: imageURL) {
            image = cachedImage
            return
        }
        
        ImageManager.shared.fetchImage(from: imageURL) { data, response in
            self.saveDataToCache(with: data, and: response)
            if imageURL.lastPathComponent == response.url?.lastPathComponent{
                self.image = UIImage(data: data)
                
            }
        }
    }
    
    private func saveDataToCache(with data: Data , and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        guard let cachedResponse = URLCache.shared.cachedResponse(for: request) else { return nil }
        guard url.lastPathComponent == cachedResponse.response.url?.lastPathComponent else { return nil }
        return UIImage(data: cachedResponse.data)
    }
}
