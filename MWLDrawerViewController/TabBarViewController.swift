//
//  TabBarViewController.swift
//  MWLDrawerViewController
//
//  Created by maweilong-PC on 2017/5/3.
//  Copyright © 2017年 maweilong. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var TitleArr:NSArray = ["消息","联系人","动态"]
    var PicArr:NSArray = ["qq","qq","qq"]
    let VCArr = [Message2ViewController(),Contacts2ViewController(),Dynamic2ViewController()]
    
    var nav:UINavigationController = UINavigationController()
    var AllVCArr:[NSObject] = [NSObject]()
    
    
    private lazy var backView: UIView = {
        var view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 49))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.insertSubview(backView, at: 0)
        /**
         alpha
         这个属性只能影响当前视图，不能连带影响子视图
         可以当做动画进行动态改变
         alpha = 0 时仍旧接收事件，但是这个操作比Hidden开销大
         hidden
         默认为NO，就是显示状态
         hidden的视图不再接收事件
         hidden的视图仍然在父视图的子视图列表里，而且响应自适应autoresizing的事件
         hidden的视图所有子视图也会被Hidden而且它们的Hidden属性不会被改变
         opaque
         如果opaque设置为YES，那么视图会被当做全视图来对待，系统会重绘整个视图
         如果opaque设置为NO，那么系统会减少开销，以其中的内容来判定重绘的视图
         如果把视图的背景色设置为透明那个，那么opaque最好设置为NO，减少开销
         */
        self.tabBar.isOpaque = true
        initNavVC()
    }

    func initNavVC()  {
        for index in 0 ..< VCArr.count {
            nav = UINavigationController.init(rootViewController: (VCArr[index] as AnyObject as! UIViewController))
            nav.tabBarItem.title = TitleArr[index] as? String
            nav.tabBarItem.image = UIImage.init(named: (PicArr[index] as? String)!)
           VCArr[index].title = (TitleArr[index] as! String)
            VCArr[index].view.backgroundColor = UIColor.white
            AllVCArr.append(nav)
        }
        self.viewControllers = AllVCArr as? [UIViewController]
        for  i in 0 ..< AllVCArr.count {
           
            (AllVCArr[i] as AnyObject).navigationBar.barTintColor = UIColor.orange
            //设置导航栏的字体颜色
            (AllVCArr[i] as AnyObject).navigationBar.titleTextAttributes =
                [NSForegroundColorAttributeName: UIColor.white]
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
