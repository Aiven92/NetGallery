//
//  NetworkImageCellViewModel.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation

class NetworkImageCellViewModel: CollectionViewCellViewModelType {
    private var photo: FlickrPhoto

    func getURL() -> URL? {
        return self.photo.ImageURL()
    }
    
    init(photo: FlickrPhoto){
        self.photo = photo
    }

}
