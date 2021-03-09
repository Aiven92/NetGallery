//
//  Flickr.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 05.03.2021.
//

import Foundation

// Take apiKey from the boottom of https://www.flickr.com/services/api/explore/flickr.photos.search
private let apiKey = "58243659e4eb7b45a48e9c839cbc4ea0"
private let elementsMaxNumber = 20

class Flickr: NetworkImageServiceType {
    /// Build search URL from tag and string URL template
    /// - Parameter tag: search request tag
    /// - Returns: complete URL for flickr API
    private func searchRequestURL(for tag: String) -> URL? {
        let URLString =
        "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&tags=\(tag)&per_page=\(elementsMaxNumber)&format=json&nojsoncallback=1"

        return URL(string: URLString)
    }
    
    /// Search request to Flickr.com with provided stringRequest as hashtag
    /// - Parameters:
    ///   - stringRequest: string search request
    ///   - completion: The completion handler to call when the search request is complete.
    func searchRequest(for stringRequest: String, completion: @escaping ([FlickrPhoto])->()){
        guard let requestURL = searchRequestURL(for: stringRequest) else { return }
        URLSession.shared.dataTask(with: URLRequest(url: requestURL)){ data, response, error in
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(FlickrPhotoSearchResponse.self, from: data)
                let photo = searchResult.photos.photo
                completion(photo)
            } catch let error {
                print("Serialization json error", error)
            }
        }.resume()
    }

}
