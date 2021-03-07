//
//  DetailViewModelType.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 07.03.2021.
//

import Foundation

protocol DetailViewViewModelType {
    var title: String { get }
    var description: String { get }
    func getURL() -> URL?
}
