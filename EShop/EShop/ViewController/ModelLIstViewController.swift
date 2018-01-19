//
//  ModelLIstViewController.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit


class ModelLIstViewController: TemplateViewController, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    var jsonObject = [HomeEnitity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addBlurNavigationBack(isNavigation: true)
        
        getUrl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

            self.collectionView?.reloadData()
        }
    }
}


extension ModelLIstViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemWidth:CGFloat = 0
        let itemHeight:CGFloat = 240
        itemWidth  = (screenSize.width/2)-15
    
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension ModelLIstViewController :UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        self.navigationController?.pushViewController(detail, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let homeEnity = jsonObject[indexPath.row] as HomeEnitity
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModelViewCell", for: indexPath) as! ModelViewCell
        cell.imgView.loadImage(url: homeEnity.imgView, "", true, handler: nil)
        cell.labelName.text = homeEnity.name
        return cell
    }
}

