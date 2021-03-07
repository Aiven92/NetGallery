//
//  NetworkImageDetailViewModel.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 07.03.2021.
//

import Foundation

class NetworkImageDetailViewModel: DetailViewViewModelType {
    private var photo: FlickrPhoto
    
    var description: String {
        return String(describing: photo.ImageURL())
    }
    
    var title: String {
        return photo.title ?? ""
    }
    
    func getURL() -> URL? {
        return self.photo.ImageURL()
    }
    
    init(photo: FlickrPhoto){
        self.photo = photo
    }
    
}
