//
//  DetailViewController.swift
//  EShop
//
//  Created by Pathmazing on 3/16/17.
//  Copyright © 2017 Pathmazing. All rights reserved.
//

import UIKit

class DetailViewController: TemplateViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableViewCell: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCell.delegate  = self
        tableViewCell.dataSource = self
        
        self.tableViewCell.register(UINib(nibName: "HeaderImageViewCell", bundle:nil), forCellReuseIdentifier: "HeaderImageViewCell")
        self.tableViewCell.register(UINib(nibName: "DescriptionViewCell", bundle:nil), forCellReuseIdentifier: "DescriptionViewCell")
        self.tableViewCell.register(UINib(nibName: "ContactViewCell", bundle:nil), forCellReuseIdentifier: "ContactViewCell")
        
        addBlurNavigationBack(isNavigation: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }else if indexPath.section == 1 {
            return 100
        }else{
            return  115
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImageViewCell", for: indexPath) as! HeaderImageViewCell
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionViewCell", for: indexPath) as! DescriptionViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactViewCell", for: indexPath) as! ContactViewCell
            return cell
        }
 
    }

}

