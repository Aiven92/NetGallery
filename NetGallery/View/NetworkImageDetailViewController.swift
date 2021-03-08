//
//  NetworkImageDetailViewController.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 07.03.2021.
//

import Foundation
import UIKit
import SDWebImage

class NetworkImageDetailViewController: UIViewController {

    var viewModel: DetailViewViewModelType?
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.sd_imageIndicator = SDWebImageActivityIndicator.gray
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
        
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        guard let selfImage = self?.image else { return }
//                        selfImage.image = image
//                        let imageSize = image.size
//                        selfImage.autoMatch(.height, to: .width, of: selfImage,
//                                             withMultiplier: imageSize.height/imageSize.width)
//                    }
//                }
//            }
//        }
        
        self.image.sd_setImage(with: url, completed: {image,_,cache,_ in
            // Ugly trick to atoscale image.
            // Warning!!! There is issue with big height of image!
            guard let imageSize = image?.size else { return }
            self.image.autoMatch(.height, to: .width, of: self.image,
                                 withMultiplier: imageSize.height/imageSize.width)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveToGalleryError(_ image: UIImage, didFinishWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // Notify user about error vith aler message
            let alert = UIAlertController(title: "Error", message: "Can't save image to gallery\n\(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @objc func action(sender: UIBarButtonItem) {
        guard let image = self.image.image else { return }
        // For use: set "Privacy - Photo Library Additions Usage Description" in Info.plist
        UIImageWriteToSavedPhotosAlbum(image , self, #selector(saveToGalleryError), nil)
    }
    
    override func viewDidLoad() {
        // Set NavBar right button and attach func
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.action(sender:)))
        
        self.addSubviews ()
        self.setupConstraints()
    }
}
