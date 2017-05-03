//
//  Message2ViewController.swift
//  MWLDrawerViewController
//
//  Created by maweilong-PC on 2017/5/3.
//  Copyright © 2017年 maweilong. All rights reserved.
//

import UIKit

class Message2ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        initButton()
    }

    //创建导航栏按钮
    func initButton() {
       let leftBtn = UIButton.init(type: .custom)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        leftBtn.addTarget(self, action: #selector(leftBtnClick(_ :)), for: .touchUpInside)
        leftBtn.setImage(UIImage.init(named:"qq"), for: .normal)
        let LeftItem = UIBarButtonItem.init(customView: leftBtn)
        navigationItem.leftBarButtonItem = LeftItem
        
        
//        let rightBtn = UIButton.init(type: .contactAdd)
//        //rightBtn.buttonType = UIBarButtonItem
//        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
//        rightBtn.addTarget(self, action: #selector(RightBtnClick(_ :)), for: .touchUpInside)
        let RightItem =  UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(RightBtnClick(_ :)))
        
        navigationItem.rightBarButtonItem = RightItem
    }
    
    
    //MARK: - 点击事件
    func leftBtnClick(_ button:UIBarButtonItem)  {
         DrawerViewController.shareDrawer?.openLeftMenu()
    }
    
    func RightBtnClick(_ button:UIBarButtonItem){
        let popVC = PopViewController()
        popVC.modalPresentationStyle = UIModalPresentationStyle.popover
        popVC.popoverPresentationController?.barButtonItem = button
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.backgroundColor = UIColor.white
       present(popVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension Message2ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
}
