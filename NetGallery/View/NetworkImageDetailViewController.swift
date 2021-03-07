//
//  NetworkImageDetailViewController.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 07.03.2021.
//

import Foundation
import UIKit

class NetworkImageDetailViewController: UIViewController {

    var viewModel: DetailViewViewModelType?
    
    private var image: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private func addSubviews(){
        self.view.addSubview(image)
    }
    
    private func setupConstraints(){
        self.image.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .bottom)
    }
    
    init(viewModel :DetailViewViewModelType) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.viewModel = viewModel
        
        self.title = viewModel.title
        
        guard let url = viewModel.getURL() else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        guard let selfImage = self?.image else { return }
                        selfImage.image = image
                        let imageSize = image.size
                        selfImage.autoMatch(.height, to: .width, of: selfImage,
                                             withMultiplier: imageSize.height/imageSize.width)
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.addSubviews ()
        self.setupConstraints()
    }
}
