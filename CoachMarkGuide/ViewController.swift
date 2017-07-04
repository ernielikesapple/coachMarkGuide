//
//  ViewController.swift
//  CoachMarkGuide
//
//  Created by ernie.cheng on 7/1/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        
        collectionView.backgroundColor = .green
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    let cellId = "cellId"
    
    //this part is not gonna be used inside the coach mark project
    //data source for each page
    let pages: [Page] = {
        let firstPage = Page(title: "1111", message: "11111111111111111", imageName: "splash-1", button: nil)
        let secondPage = Page(title: "22222", message: "22222222222222222", imageName: "splash-2", button: nil)
        let thirdPage = Page(title: "33333", message: "3333333333", imageName: "splash-3", button: nil)
        let fourthPage = Page(title: "44444444", message: "444444444", imageName: "splash-4", button: nil)
        
        return [firstPage,secondPage,thirdPage,fourthPage]
    }()
    
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 167/255, green: 32/255, blue: 58/255, alpha: 1)
        pc.numberOfPages = 4
        return pc
    }()
    
    //the close button for each page
//    let closeButton : UIButton = {
//    
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
       _ = pageControl.anchor(top: nil,
                           left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           bottomConstant: 30,
                           heightConstant: 30)
        
        collectionView.anchorAllRound(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewDidLayoutSubviews() {
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
    
    //items for collcetionView is rows for tableView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //this part is not gonna be used inside the coach mark project
        return pages.count
        
        //return 4
    }
    
    //the content in a item is called cell, just like in the tableView, cellForRow at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        //cell.backgroundColor = .white
        cell.page = pages[indexPath.item]
        return cell
    }
    
    //define the size of each item in the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

