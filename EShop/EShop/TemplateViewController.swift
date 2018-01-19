//
//  TemplateViewController.swift
//  Tesjor
//
//  Created by Chris Chan on 5/24/16.
//  Copyright © 2016 Justin. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {

    typealias RefreshButtonBlock = (() -> Void)
    var onRefreshButtonClicked : RefreshButtonBlock?
    
    //View
    var temEmptyView            : UIView?
    var internetStatusLabel     : UILabel?
    var bigErrorView            : UIView?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        //let className = NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func addBlurNavigationBack(isNavigation:Bool){
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonMenu: UIButton = UIButton(type: UIButtonType.custom) as UIButton
        buttonMenu.frame = CGRect(x: 0, y: 0, width: 15, height: 17)
        buttonMenu.setImage(UIImage(named:"ic_back"), for: UIControlState.normal)
        buttonMenu.addTarget(self, action: #selector(TemplateViewController.onBackButtonClicked(_:)), for: .touchUpInside)
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonMenu)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xeaadad7)
        
    }
    
    func addBlurNavigationClose(isNavigation:Bool){
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        let buttonMenu: UIButton = UIButton(type: UIButtonType.custom) as UIButton
        buttonMenu.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        buttonMenu.setImage(UIImage(named:"ic_close"), for: UIControlState.normal)
        buttonMenu.addTarget(self, action:#selector(TemplateViewController.dismissViewController(sender:)), for: .touchUpInside)
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: buttonMenu)
        self.navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xeaadad7)
        
    }


    //MARK:Empty No Data
    func showEmptyData(view:UIView,backgroundColor color:UIColor) {
        if temEmptyView == nil
        {
            temEmptyView = UIView(frame: CGRect(x: 0, y:screenSize.height / 2 - 100, width:screenSize.width, height: 110))
            temEmptyView!.backgroundColor = color
            
            let smallLb = UILabel(frame: CGRect(x: 0, y: 55, width: temEmptyView!.frame.width, height: 20))
            smallLb.textAlignment   = .center
            smallLb.textColor       = UIColor.darkGray
            smallLb.text            = "No Data"
            temEmptyView!.addSubview(smallLb)
        }
        self.view.addSubview(temEmptyView!)
    }
    
    func showHistoryEmptyData(view:UIView,backgroundColor color:UIColor) {
        if temEmptyView == nil
        {
            temEmptyView = UIView(frame: CGRect(x: 0, y:screenSize.height / 2 - 100, width:screenSize.width, height: 110))
            temEmptyView!.backgroundColor = color
            
            let smallLb = UILabel(frame: CGRect(x: 0, y: 55, width: temEmptyView!.frame.width, height: 20))
            smallLb.textAlignment   = .center
            smallLb.textColor       = UIColor.darkGray
            smallLb.text            = "No Redemption History"
            temEmptyView!.addSubview(smallLb)
        }
        self.view.addSubview(temEmptyView!)
    }
    
    //MARK:Hide Empty No Data
    func hideEmptyData(){
        if temEmptyView != nil{
            temEmptyView?.removeFromSuperview()
        }
    }
    
    func alertConfirmController(title:String,message:String){
        let uiAlert = UIAlertController(title:title, message:message, preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in}))
    }
    func alertConfirmController(title:String, message:String,callBackClick:@escaping ()->Void){
        let uiAlert = UIAlertController(title:title, message:message, preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            callBackClick();
        }))
    }
    
    func hideKeyboardAll(){
        self.view.endEditing(true)
    }
    


    func onCustomNavigationTitleView(title:String) {
        let titleLabel                  = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
        titleLabel.backgroundColor      = UIColor.clear
        titleLabel.textColor            = UIColor.white
        titleLabel.text                 = title
        titleLabel.sizeToFit()
        titleLabel.textAlignment        = NSTextAlignment.center
        self.navigationItem.titleView   = titleLabel
    }
    
    
    func addCustomizeButtonsItemsAtLeftSide(leftItems:[UIBarButtonItem], rightItems:[UIBarButtonItem]) {
        self.navigationItem.leftBarButtonItems = leftItems
        self.navigationItem.rightBarButtonItems = rightItems
    }
    
    func onBackButtonClicked(_ button: UIButton) {
        self.popViewController()
    }
    
    func dismissViewController(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func popViewController() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func clearBackgroundNavigation(isClear:Bool) {
        
        if isClear {
            // Navigation clear background
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true;
            self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        } else {
            // Navigation have background
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: .default)
            self.navigationController?.navigationBar.isTranslucent = false;
            self.navigationController?.navigationBar.shadowImage = UIImage(named: "navbar-iphone.png")
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:Remove Notification
    
    //MARK: - Internet Connection
 
    func updateFrameOfSmallErrorAtCoordinateY(coordinateY:CGFloat) {
        
        self.bigErrorView?.isHidden = true
        self.internetStatusLabel?.frame = CGRect.init(x: 0, y: coordinateY, width: screenSize.width, height: 30)
        UIView.animate(withDuration: 0.8, delay: 0.3, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.internetStatusLabel?.isHidden = false
            self.internetStatusLabel?.alpha = 0.5
            }, completion: { (finish) in
                self.internetStatusLabel?.alpha = 0.9
        })
    }
    
    func updateFrameOfBigErrorAtCoordinateY(coordinateY:CGFloat) {
        
        self.internetStatusLabel?.isHidden = true
        self.bigErrorView?.isHidden = false
        self.bigErrorView?.frame = CGRect.init(x: 0, y: coordinateY, width: screenSize.width, height: self.view.bounds.height - 40)
    }
    
    func onRefreshButtonClicked(sender:UIButton) {
        
        self.onRefreshButtonClicked!()
    }
    
    func removeBingErrorConnectionView() {
    
        self.bigErrorView?.isHidden = true
    }
    
    //Remove Notification

    
    func getOriginalAbxistY() -> CGFloat {
        
        return  screenSize.height - 75
    }
    
    func alphaClearController(view:UIView){

        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.repeat, .curveEaseOut, .autoreverse], animations: {
            view.alpha = 0
        }, completion:{ (finished: Bool) -> Void in
        })
    }

}
