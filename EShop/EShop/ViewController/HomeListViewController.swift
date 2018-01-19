//
//  HomeListViewController.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeListViewController: UIViewController {
    fileprivate var numbers: [Int] = []
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    @IBOutlet var collectionView: UICollectionView!

    var jsonObject = [HomeEnitity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getUrl()
        self.addMenuNavItemOnView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMenuNavItemOnView(){
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonMenu: UIButton = UIButton(type: UIButtonType.custom) as UIButton
        buttonMenu.frame = CGRect(x: 0, y: 0, width: 27, height: 22) //CGRectMake(0, 0, 27, 22)
        buttonMenu.setImage(UIImage(named:"icon_menu"), for: UIControlState.normal)
        buttonMenu.addTarget(self, action: #selector(HomeListViewController.leftMenuNavButtonClick(_:)), for: .touchUpInside)
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonMenu)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
        
        // RIGHT BUTTON
        
        //let buttonAddProduct: UIButton = UIButton(type: UIButtonType.custom) as UIButton
        //buttonAddProduct.frame = CGRect(x: 0, y: 0, width: 27, height: 22) //CGRectMake(0, 0, 27, 22)
        //buttonAddProduct.setImage(UIImage(named:"ic_add_product"), for: UIControlState.normal)
        //buttonAddProduct.addTarget(self, action: #selector(HomeListViewController.leftMenuNavButtonClick(_:)), for: UIControlEvents.TouchUpInside)
        //let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonAddProduct)
        //self.navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xeaadad7)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    func leftMenuNavButtonClick(_ button: UIButton)
    {
        let detail = ShopListViewController(nibName: "ShopListViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: detail)
        self.present(nav, animated: true, completion: nil)
    
    }
    
    func getUrl() {
        http.get(url: "http://androidblog.esy.es/ImageJsonData.php", parameters: [ : ]) { (success, JSON) in
            if success {
                for i in 0..<JSON.count{
                    let homeEnity = HomeEnitity()
                    let name = JSON[i]["image_title"].stringValue
                    let image_url = JSON[i]["image_url"].stringValue
                    
                    homeEnity.name = name
                    homeEnity.imgView = image_url
                    
                    self.jsonObject.append(homeEnity)
                }
            }
            for _ in 0...self.jsonObject.count {
                let height = Int(arc4random_uniform((UInt32(100)))) + 100
                self.numbers.append(height)
            }
            self.collectionView.reloadData()
        }
    }
}

extension HomeListViewController: CHTCollectionViewDelegateWaterfallLayout {

    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int((view.bounds.width - 40)/3), height: numbers[indexPath.item])
    }
}

extension HomeListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeEnitiy = jsonObject[indexPath.row] as HomeEnitity
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeListViewCell", for: indexPath) as! HomeListViewCell
        
        cell.labelName.text = homeEnitiy.name
        cell.imgView.loadImage(url: homeEnitiy.imgView, "", true, handler: nil)
        
        return cell
    }
}

//MARK: one little trick
extension CHTCollectionViewWaterfallLayout {
    
    internal override func invalidationContext(forInteractivelyMovingItems targetIndexPaths: [IndexPath], withTargetPosition targetPosition: CGPoint, previousIndexPaths: [IndexPath], previousPosition: CGPoint) -> UICollectionViewLayoutInvalidationContext {
        
        let context = super.invalidationContext(forInteractivelyMovingItems: targetIndexPaths, withTargetPosition: targetPosition, previousIndexPaths: previousIndexPaths, previousPosition: previousPosition)
        
        self.delegate?.collectionView!(self.collectionView!, moveItemAt: previousIndexPaths[0], to: targetIndexPaths[0])
        
        return context
    }
}
