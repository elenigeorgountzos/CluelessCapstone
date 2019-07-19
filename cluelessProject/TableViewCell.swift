//
//  TableViewCell.swift
//  cluelessProject
//
//  Created by girlswhocode on 7/18/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    
    
    var itemsArray = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(itemsArray)
        galleryCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! CollectionViewCell
        cell.itemImage.image = UIImage(named: itemsArray[indexPath.item])
        return cell
    }
    
    func reloadCell() {
        galleryCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 150)
    }
    
}
