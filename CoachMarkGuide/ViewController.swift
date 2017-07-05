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
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        
        
       // collectionView.backgroundColor = .green
        
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    let cellId = "cellId"
    let cellLastPage = "cellLastPage"
    
    //this part is not gonna be used inside the coach mark project
    //data source for each page
    let pages: [Page] = {
        //let closeButton = UIButton()
       // closeButton.setTitle("Close", for: .normal)
        let state1 = ButtonState(isHighted: false, isEnabled: false)
        let state2 = ButtonState(isHighted: true, isEnabled: true)
        
        let firstPage = Page(title: "1111", message: "11111111111111111", imageName: "splash-1", buttonState: nil)
        let secondPage = Page(title: "22222", message: "22222222222222222", imageName: "splash-2", buttonState:  nil)
        let thirdPage = Page(title: "33333", message: "3333333333", imageName: "splash-3", buttonState:  nil)
        let fourthPage = Page(title: "44444444", message: "444444444", imageName: "splash-4", buttonState:  nil)
        
        return [firstPage,secondPage,thirdPage,fourthPage]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.3)
        pc.currentPageIndicatorTintColor = UIColor(red: 167/255, green: 32/255, blue: 58/255, alpha: 1)
        pc.numberOfPages = self.pages.count
        //pc.numberOfPages = self.pages.count
        return pc
    }()
    
    //the close button for each page
//    let closeButton : UIButton = {
//    
//    }()
    
    
    lazy var Button : UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds =  true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.3).cgColor
        //button
        //button.titleLabel?.font = UIFont(name: "System", size: 20)
        // button.tintColor = UIColor(red: 167/255, green: 32/255, blue: 58/255, alpha: 1)
        // button.frame = CGRect(x: 0, y: 0, width: 20, height: 80)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Close", for: .highlighted)
        button.setTitleColor(.white, for: .highlighted)
        button.isEnabled = false
        
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    func closeButtonTapped() {
        
        //dismiss this viewcontroller go to the tabbar view controller
        print("close button tapped")
    }
    
    
    
    //doozy change layout using code dynamically snippet#1
   // var pageControlBottomAnChor: NSLayoutConstraint?//have a reference to the bottom layout of the pageControl, so that we can move it up and down based on screen orientation or screen size changes
    //try to learn this good way to change layout dynamically
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(Button)
        
        _ = pageControl.anchor(top: nil,
                           left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           bottomConstant: 30,
                           heightConstant: 30)
        
        //doozy change layout using code dynamically snippet#2
//        pageControlBottomAnChor = pageControl.anchor(top: nil,
//                               left: view.leftAnchor,
//                               bottom: view.bottomAnchor,
//                               right: view.rightAnchor,
//                               bottomConstant: 30,
//                               heightConstant: 30)[1] //"[1]"refer to the bottomAnchor constraint
        
        
        
        
        collectionView.anchorAllRound(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        _ = Button.anchor(top: view.topAnchor, right: view.rightAnchor, topConstant: 30, rightConstant: 50, widthConstant: 70, heightConstant: 35)
        
        registerCells()
        
    }
    
    fileprivate func registerCells(){
    
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        //if we have different content from the previous three pages then we might use a different cell Identifier
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellLastPage)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x)
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        if pageNumber >= pages.count - 1{
            self.Button.backgroundColor = UIColor(red: 167/255, green: 32/255, blue: 58/255, alpha: 1)
            self.Button.setTitleColor(.white, for: .normal)
            //self.Button.titleLabel?.textColor = .white
            self.Button.isEnabled = true
            
            
            //doozy change layout using code dynamically snippet#3
            //pageControlBottomAnChor?.constant = 30
    
            
            
            
        }else{
            
            //doozy change layout using code dynamically snippet#4
           // pageControlBottomAnChor?.constant = -30
            
            self.Button.layer.cornerRadius = 5
            self.Button.layer.masksToBounds =  true
            self.Button.layer.borderWidth = 1
            self.Button.layer.borderColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.3).cgColor
            self.Button.backgroundColor = .clear
            self.Button.setTitleColor(.gray, for: .normal)
            self.Button.isEnabled = false
        }
        
        //doozy change layout using code dynamically snippet#5
//        UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       options: .curveEaseOut,
//                       animations: {
//                        self.view.layoutIfNeeded()
//        }, completion: nil)
        
        
//            UIView.animate(withDuration: 0.5,
//                           delay: 0,
//                           usingSpringWithDamping: 1,
//                           initialSpringVelocity: 1,
//                           options: .curveEaseOut,
//                           animations: {
//                           self.view.layoutIfNeeded()
//            }, completion: nil)
//        
    
        print("🔥🔥🔥🔥🔥 current page is \(pageNumber)")
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        
    }
//    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
//            return
//        }
//        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
//            //here you can do the logic for the cell size if phone is in landscape
//        } else {
//            //logic if not landscape
//        }
//        flowLayout.invalidateLayout()
//    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //items for collcetionView is rows for tableView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //this part is not gonna be used inside the coach mark project
        return pages.count
        
        //return 4
    }
    
    //the content in a item is called cell, just like in the tableView, cellForRow at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
//        if indexPath.item ==  pages.count - 1 {
//          
////            let lastPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellLastPage, for: indexPath)
////            return lastPageCell
//        }
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        //cell.backgroundColor = .white
        cell.page = pages[indexPath.item]
        
        print("-----?????-----\(indexPath.item)---------")
        return cell
    }
    
    //define the size of each item in the cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if view.frame.width < view.frame.height {
//            return CGSize(width: view.frame.height, height: view.frame.width)
//            
//        }else{
//            return CGSize(width: view.frame.width, height: view.frame.height)
//        }
//       
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust cell size for orientation
        
//       
//        if UIApplication.shared.statusBarOrientation.isLandscape {
//             print("横屏屏幕宽度是 \(view.frame.width)")
//        return CGSize(width: view.frame.width, height: view.frame.height)
//            //return CGSize(width: view.frame.height, height: view.frame.width)
//            //return CGSize(width: CGFloat(170.0), height: CGFloat(170.0))
//        }
//         print("shushushushushushu \(view.frame.width)")
         return CGSize(width: view.frame.width, height: view.frame.height)
        
        //return CGSize(width: CGFloat(192.0), height: CGFloat(192.0))
    }
    
//    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
//        collectionView.performBatchUpdates(nil, completion: { _ in })
//    }
    
    
    //for ipad we use viewWillTransition to size cause the newTraitCollection only works for iPhone, for iPad the size class for both orientation is the same
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
        
      //  collectionView.performBatchUpdates(nil, completion: { _ in })
       
        self.collectionView.collectionViewLayout.invalidateLayout()
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: indexPath,
                                             at: .centeredHorizontally,
                                             animated: true)
            self.collectionView.reloadData()
        }
        
//        coordinator.animate(alongsideTransition: {(_ context: UIViewControllerTransitionCoordinatorContext) -> Void in
//            let orientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
//            // do whatever
//            
//          
//            
//        }, completion: {(_ context: UIViewControllerTransitionCoordinatorContext) -> Void in
//        })
        
        //super.viewWillTransition(to: size, with: coordinator)
        
        
        
    }
    
 



    
    
}

