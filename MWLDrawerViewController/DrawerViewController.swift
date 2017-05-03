//
//  DrawerViewController.swift
//  MWLDrawerViewController
//
//  Created by maweilong-PC on 2017/4/26.
//  Copyright © 2017年 maweilong. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    
    var mainVC : UIViewController?
    var LeftVC : UIViewController?
    var maxWidth: CGFloat = 300
    //MARK: - 单例
    static let shareDrawer = UIApplication.shared.keyWindow?.rootViewController as? DrawerViewController
    
    init(mainVC: UIViewController,leftVC: UIViewController,leftWidth: CGFloat) {
        super.init(nibName: nil, bundle: nil)
        self.mainVC = mainVC
        self.LeftVC = leftVC
        self.maxWidth = leftWidth;
        
        view.addSubview(leftVC.view)
        view.addSubview(mainVC.view)
        
        addChildViewController(leftVC)
        addChildViewController(mainVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeftVC?.view.transform = CGAffineTransform.init(translationX: -maxWidth, y: 0);
        for childViewController in (mainVC?.childViewControllers)! {
            
             addScreenEdgePanGestureRecongnizerToView(view: childViewController.view)
//
        }
        
    }

    
    
    //MARK: - 添加屏幕边缘手势
    private func addScreenEdgePanGestureRecongnizerToView(view:UIView){
        let pan = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(edgPanGesture(_:)))
        pan.edges = UIRectEdge.left
        view.addGestureRecognizer(pan);
        
    }
    
    func edgPanGesture(_ pan:UIScreenEdgePanGestureRecognizer) {
        let offsetX = pan.translation(in: pan.view).x
        if pan.state == UIGestureRecognizerState.changed && offsetX <= maxWidth {
            mainVC?.view.transform = CGAffineTransform.init(translationX: max(offsetX, 0), y: 0 )
            LeftVC?.view.transform = CGAffineTransform.init(translationX: -maxWidth + offsetX, y: 0)
            
        }else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed{
            if offsetX > ScreenWidth * 0.5 {
                openLeftMenu()
            }else{
                closeLeftMenu()
            }
        }
        
    }
    
    //MARK: - 遮盖按钮手势
    func panCloseLeftMenu(_ pan: UIPanGestureRecognizer){
        let offsetX = pan.translation(in: pan.view).x
        if offsetX > 0 {
            return
        }
        if pan.state == UIGestureRecognizerState.changed && offsetX >= -maxWidth{
            let distace = maxWidth  + offsetX
            mainVC?.view.transform = CGAffineTransform.init(translationX: distace, y: 0)
            LeftVC?.view.transform = CGAffineTransform.init(translationX: offsetX, y: 0)
            
            
        }else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed{
            if offsetX > ScreenWidth/2 {
                openLeftMenu()
            }else{
                closeLeftMenu()
            }
        }
        
    }
    
    //MARK: - 侧边栏跳转功能
    func LeftViewController(didSelectController view:UIViewController){
        let tabBarVC = mainVC as? UITabBarController
        let nav = tabBarVC?.selectedViewController as? UINavigationController
        view.hidesBottomBarWhenPushed = true
        nav?.pushViewController(view, animated: false)
        closeLeftMenu()
        
        
    }
    
    //MARK: - 打开左侧菜单

    
    func openLeftMenu()  {
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: { 
            self.LeftVC?.view.transform = CGAffineTransform.identity
            self.mainVC?.view.transform = CGAffineTransform.init(translationX: self.maxWidth, y: 0)
        }, completion: {
            
            (finish: Bool) -> () in
            self.mainVC?.view.addSubview(self.coverBtn)
        })
    }
    //MARK: - 关闭左侧菜单
    func closeLeftMenu()  {
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: { 
            self.LeftVC?.view.transform = CGAffineTransform.init(translationX: -self.maxWidth, y: 0)
            self.mainVC?.view.transform = CGAffineTransform.identity
        }) {
            (finish: Bool) in
            self.coverBtn.removeFromSuperview()
        }
    }
    
    //MARK: - 灰色背景的关闭按钮
    private lazy var coverBtn: UIButton =
    {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.ScreenWidth , height: self.ScreenHeight))
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(closeLeftMenu), for: .touchUpInside)
        btn.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCloseLeftMenu(_:))))
        
       return btn
    }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
