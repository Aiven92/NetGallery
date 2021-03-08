//
//  NetworkImageCell.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 06.03.2021.
//

import Foundation
import UIKit
import SDWebImage

class NetworkImageCell: UICollectionViewCell {
    weak var viewModel: CollectionViewCellViewModelType? {
        willSet(viewModel){
            guard let viewModel = viewModel,
                  let url = viewModel.getURL()
            else { return }
            
            // First implementation: async image view. Without caching
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url) {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self?.image.image = image
//                        }
//                    }
//                }
//            }
            
            // Second varian: SDWebImage async + caching
            self.image.sd_setImage(with: url, completed: {_,_,_,_ in })
        }
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true // Cutoff
        image.layer.cornerRadius = 12
        image.sd_imageIndicator = SDWebImageActivityIndicator.gray
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
