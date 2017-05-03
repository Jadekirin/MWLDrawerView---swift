//
//  MessageViewController.swift
//  MWLDrawerViewController
//
//  Created by maweilong-PC on 2017/4/27.
//  Copyright © 2017年 maweilong. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

   
    //点击打开侧边栏
    @IBAction func ClickOpenLeftVc(_ sender: UIBarButtonItem) {
        DrawerViewController.shareDrawer?.openLeftMenu()
    }
    
    //mark - 更多功能
    @IBAction func showAlter(_ sender: UIBarButtonItem) {
    
        let popVC = PopViewController()
        popVC.modalPresentationStyle = UIModalPresentationStyle.popover
        popVC.popoverPresentationController?.barButtonItem = sender
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.backgroundColor = UIColor.white
        present(popVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension MessageViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
}
