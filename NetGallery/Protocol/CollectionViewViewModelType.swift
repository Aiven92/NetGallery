//
//  CollectionViewViewModelType.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation

protocol CollectionViewViewModelType {
    func numberOfSections() -> Int
    func numberOfItemsInSection(section: Int) -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType
    func detailViewModel(forIndexPath indexPath: IndexPath) -> DetailViewViewModelType
    
    func searchRequest(for stringRequest: String, completion: @escaping()->())
}
