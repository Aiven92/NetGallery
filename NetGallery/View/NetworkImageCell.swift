//
//  NetworkImageCell.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation
import UIKit

class NetworkImageCell: UICollectionViewCell {
    weak var viewModel: CollectionViewCellViewModelType? {
        willSet(viewModel){
            guard let viewModel = viewModel,
                  let url = viewModel.getURL()
            else { return }
            
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image.image = image
                        }
                    }
                }
            }
        }
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true // Cutoff
        image.layer.cornerRadius = 12
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(image)
        image.autoPinEdgesToSuperviewEdges()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
