//
//  FlickrPhoto.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 05.03.2021.
//

import Foundation

struct FlickrPhotoSearchResult: Decodable {
    let perpage: Int
    let total: String
    let photo: [FlickrPhoto]
}
struct FlickrPhotoSearchResponse: Decodable {
    let photos: FlickrPhotoSearchResult
    let stat: String
}

struct FlickrPhoto: Decodable {
    // Data from serach request
    let id: String?
    let secret: String?
    let server: String?
    let title: String?
    
    // Data from imageInfoRequest
    let description: String?
    let autorName: String?
    let date: String?
    
    // Not good solution
    // URL build logic is part of API, not a model
    func ImageURL() -> URL?{
        guard
            let id = self.id,
            let secret = self.secret,
            let server = self.server
        else { return nil }

        return URL(string: "https://live.staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")
    }
}
