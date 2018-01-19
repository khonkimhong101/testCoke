//
//  ShopListViewController.swift
//  EShop
//
//  Created by Pathmazing on 3/17/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class ShopListViewController: TemplateViewController {
    
    @IBOutlet var tableViewCell: UITableView!
    var jsonObject = [HomeEnitity]()
    var defaulHeightRow: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate  = self
        tableViewCell.dataSource = self
        
        self.tableViewCell.contentInset = UIEdgeInsetsMake(0, 0, 75, 0)
        self.tableViewCell.contentInset = CGPointMake(0, 0  - self.tableViewCell.contentInset.buttom)
        self.defaulHeightRow    = getHeightImage(defaulHeight: 150, defaulWidth: 375, newWeidth: screenSize.size.width - 24) + 54
        self.tableViewCell.register(UINib(nibName: "ShopListViewCell", bundle:nil), forCellReuseIdentifier: "ShopListViewCell")
        addBlurNavigationClose(isNavigation: true)
        self.getUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUrl() {
        http.get(url: "http://api.androidhive.info/json/glide.json", parameters: [ : ]) { (success, JSON) in
            if success {
                for i in 0..<JSON.count{
                    print("i == \(i)")
                    let homeEnity = HomeEnitity()
//                    let name = JSON[i]["image_title"].stringValue
                    let image_url = JSON[i]["url"]["medium"].stringValue
//                    homeEnity.name = name
                    homeEnity.imgView = image_url
                    
                    self.jsonObject.append(homeEnity)
                }
            }else{
                print("error json \(JSON)")
            }

            self.tableViewCell.reloadData()
        }
    }
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return defaulHeightRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let modelLIstView = storyboard.instantiateViewController(withIdentifier: "ModelLIstViewController") as! ModelLIstViewController
        self.navigationController?.pushViewController(modelLIstView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeEnity = jsonObject[indexPath.row] as HomeEnitity
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListViewCell", for: indexPath) as! ShopListViewCell
        
        //cell.imgView.loadImage(url: homeEnity.imgView, "", true, handler: nil)
        cell.labelName.text = homeEnity.name
        
        return cell
        
    }
}
