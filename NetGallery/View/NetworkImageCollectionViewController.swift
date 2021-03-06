//
//  NetworkImagesCollectionViewController.swift
//  NetGallery
//
//  Created by Vasiliy Samarin on 04.03.2021.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

class NetworkImagesCollectionViewController: UICollectionViewController {
    private var timer: Timer?
    var viewModel: CollectionViewViewModelType!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    private func updateViewForSearchRequest(for request: String) {
        viewModel.searchRequest(for: request, completion: {
            DispatchQueue.main.async { self.collectionView.reloadData()}
        })
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Flickr"
        
        setupSearchBar()
        viewModel = NetworkImageCollectionViewViewModel()
        
        updateViewForSearchRequest(for: "Electrolux")
        
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(NetworkImageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension NetworkImagesCollectionViewController: UICollectionViewDelegateFlowLayout {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        let numberOfSections = viewModel.numberOfSections()
        return numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItemsInSection = viewModel.numberOfItemsInSection(section: section)
        return numberOfItemsInSection
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? NetworkImageCell
        
        guard let collectionViewCell = cell, let viewModel = viewModel else{ return UICollectionViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        // Create cell with own viewModel, generated by upper viewModel
        collectionViewCell.viewModel = cellViewModel
        
        return collectionViewCell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else{ return }

        let detailViewModel = viewModel.detailViewModel(forIndexPath: indexPath)
        let detailViewController = NetworkImageDetailViewController(viewModel: detailViewModel)
        
        
        detailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailViewController, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (self.view.frame.width - 8) / 2
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension NetworkImagesCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }

        // Start search request only after small delay after last input symbol
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.updateViewForSearchRequest(for: text)
        })
    }
}
