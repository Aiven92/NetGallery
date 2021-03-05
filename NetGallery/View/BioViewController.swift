//
//  ViewController.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 03.03.2021.
//

import UIKit
import PureLayout

class BioViewController: UIViewController {
    private var viewModel = BioViewModel()
    
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: viewModel.imageName))
        imageView.autoSetDimensions(to: CGSize(width: 375/2, height: 500/2))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel()
        nameLable.text = viewModel.fullName
        nameLable.textColor = .black
        nameLable.textAlignment = .center
        nameLable.font = nameLable.font.withSize(25)
        nameLable.adjustsFontSizeToFitWidth = true
        return nameLable
    }()
    
    lazy var headView: UIView = {
        let headView = UIView()
        headView.addSubview(avatar)
        
        avatar.autoPinEdge(toSuperviewEdge: .left)
        avatar.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        headView.autoMatch(.height, to: .height, of: avatar)
        headView.addSubview(nameLable)
        
        nameLable.autoPinEdge(toSuperviewEdge: .right, withInset: 16.0)
        nameLable.autoPinEdge(toSuperviewEdge: .top)
        nameLable.autoPinEdge(.left, to: .right, of: avatar, withOffset: 16.0)
        
        
        return headView
    }()
    
    lazy var bioTitleLable: UILabel = {
        let bioTitleLable = UILabel()
        bioTitleLable.text = "BIO"
        bioTitleLable.font = UIFont.boldSystemFont(ofSize: 16.0)
        return bioTitleLable
    }()
    
    lazy var bioTextLable: UILabel = {
        let bioTextLable = UILabel()
        bioTextLable.numberOfLines = 0
        bioTextLable.text = viewModel.bio
        return bioTextLable
    }()
    
    
    func addSubviews() {
        let scrollView = UIScrollView.newAutoLayout()
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(headView)
        scrollView.addSubview(bioTitleLable)
        scrollView.addSubview(bioTextLable)
        
        scrollView.autoPinEdgesToSuperviewSafeArea()
    }
    
    func setupConstraints() {
        headView.autoPinEdge(toSuperviewEdge: .top, withInset: 16.0)
        headView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16.0)
        headView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16.0)
        
        bioTitleLable.autoPinEdge(.top, to: .bottom, of: headView, withOffset: 16.0)
        bioTitleLable.autoAlignAxis(toSuperviewMarginAxis: .vertical)
        
        bioTextLable.autoPinEdge(.top, to: .bottom, of: bioTitleLable)
        bioTextLable.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16.0)
        bioTextLable.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16.0)
        bioTextLable.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubviews ()
        self.setupConstraints()
    }

}

