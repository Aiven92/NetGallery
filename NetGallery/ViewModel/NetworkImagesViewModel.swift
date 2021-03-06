//
//  NetworkImagesViewModel.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation

class NetworkImageCollectionViewViewModel {
    
    // Service injecting
    private(set) var webservice: NetworkImageServiceType = Flickr()
    
    var searchString: String = ""
    var NetworkImages: [FlickrPhoto] = [FlickrPhoto]()
}

extension NetworkImageCollectionViewViewModel: CollectionViewViewModelType {
    func searchRequest(for stringRequest: String, completion: @escaping()->() ){
        // Do not call search request if string is the same
        if self.searchString == stringRequest { return }
        self.searchString = stringRequest
        
        webservice.searchRequest(for: stringRequest, completion: { Photos in
            self.NetworkImages = Photos
            completion()
        })
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return NetworkImages.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType {
        print("request for cell \(indexPath.row) of \(NetworkImages.count)")
        let networkImage = NetworkImages[indexPath.row]
        return NetworkImageCellViewModel(photo: networkImage)
    }
}
