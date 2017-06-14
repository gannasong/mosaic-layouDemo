//
//  MainCollectionViewController.swift
//  mosaic-layouDemo
//
//  Created by SUNG HAO LIN on 2017/6/13.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit
import TRMosaicLayout


class MainCollectionViewController: UICollectionViewController {

    
    let demoImage = ["test01","test02","test03","test04","test05","test06","test07","test08","test09",
                        "test10","test11","test12","test13","test14","test15","test16","test17"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return demoImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCollectionViewCell
        cell.testImageView.image = UIImage(named: demoImage[indexPath.row])
        
    
        return cell
    }

    
    
  
    
    
    
    
    //
}


//  須實作 TRMosaicLayoutDelegate
extension MainCollectionViewController: TRMosaicLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big: TRMosaicCellType.small
    }
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
    
    
}
