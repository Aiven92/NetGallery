//
//  NetworkImageServiceType.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation

protocol NetworkImageServiceType {
    func searchRequest(for stringRequest: String, completion: @escaping ([FlickrPhoto])->())
}
