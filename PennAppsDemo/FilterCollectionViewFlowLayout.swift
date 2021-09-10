//
//  FilterCollectionViewFlowLayout.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/9/21.
//

import UIKit

class FilterCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    let edgeInset: CGFloat = 6
    let itemHeight: CGFloat = 34
    let itemWidth: CGFloat = 100
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumLineSpacing = edgeInset
        minimumInteritemSpacing = edgeInset
        scrollDirection = .horizontal
        sectionInset = .zero
    }
}

