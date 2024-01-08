//
//  SVGRecentlyGeneratedViewController.swift
//  SVGAssignment
//
//  Created by Kuldeep Singh on 08/01/24.
//

import UIKit

typealias Delegates = UICollectionViewDataSource  & UICollectionViewDelegateFlowLayout

class SVGRecentlyGeneratedViewController: UIViewController {
    @IBOutlet weak var clearMyRecentlyViewd: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearMyRecentlyViewd.configureButton(title: "Clear Dogs!", titleColor: .white, cornerRadius: 10)
        collectionView.register(UINib(nibName: SVGImageCell.identitifer, bundle: .main), forCellWithReuseIdentifier: SVGImageCell.identitifer)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    @IBAction func clearMyRecentlyViewed(_ sender: UIButton) {
        SVGImageCache.clearCacheData()
        collectionView.reloadData()
    }
}



extension SVGRecentlyGeneratedViewController : Delegates{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SVGImageCell.identitifer, for: indexPath) as? SVGImageCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(image: SVGImageCache.cacheData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SVGImageCache.cacheData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 50, height: collectionView.frame.height)
    }
}
