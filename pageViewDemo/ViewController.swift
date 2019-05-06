//
//  ViewController.swift
//  pageViewDemo
//
//  Created by mac on 03/05/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var cuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //cuCollectionView.isPagingEnabled = true
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pagecontrol.currentPage = Int(x / cuCollectionView.frame.width)
        
    }
    @IBAction func btnNext(_ sender: UIButton) {
        
        let nextIndex = min(pagecontrol.currentPage + 1 , 1)
        pagecontrol.currentPage = nextIndex
        let indexpath = IndexPath(item: nextIndex, section: 0)
        cuCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func btnPre(_ sender: UIButton) {
        
        let nextIndex = max(pagecontrol.currentPage - 1, 0)
        pagecontrol.currentPage = nextIndex
        let indexpath = IndexPath(item: nextIndex, section: 0)
        cuCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
    }
    

}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath)
        
        return cell
        
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

