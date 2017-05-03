//
//  LeftMenuViewController.swift
//  MWLDrawerViewController
//
//  Created by maweilong-PC on 2017/4/26.
//  Copyright © 2017 maweilong. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let headerViewH: CGFloat = 200
    
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    
    var dataArray = [["我的商城","sidebar_business"],["QQ钱包","sidebar_purse"],["个性装扮","sidebar_decoration"],["我的收藏","sidebar_favorit"],["我的相册","sidebar_album"],["我的文件","sidebar_file"]]
    
    private lazy var tableView: UITableView = {
        let tab = UITableView.init(frame: CGRect.init(x: 0, y: self.headerViewH, width: self.ScreenWidth, height: self.ScreenHeight - self.headerViewH), style: .plain)
     
        tab.backgroundColor = UIColor(colorLiteralRed: 13.0 / 255.0, green: 184.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
        tab.separatorStyle = UITableViewCellSeparatorStyle.none
        tab.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        tab.delegate = self
        tab.dataSource = self
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        
        return tab
        
    
    }()
//    func va() ->  {
//        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.ScreenWidth, height: self.headerViewH))
//        let bgImageView = UIImageView.init(frame: header.frame);
//        
//    }
    
    private lazy var headerView: UIView = {
        
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.ScreenWidth, height: self.headerViewH))
        let bgImageView = UIImageView.init(frame: header.frame);
        bgImageView.image = UIImage.init(named: "sidebar_bg")
        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        bgImageView.clipsToBounds = true
        header.addSubview(bgImageView)
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.addSubview(tableView)
    }

    
    
    //MARK: - UItableView 代理
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = self.dataArray[indexPath.row][0]
        cell.imageView?.image = UIImage.init(named: dataArray[indexPath.row][1])
        cell.textLabel?.textColor = UIColor.white
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = UIViewController()
        vc.title = dataArray[indexPath.row][0]
        vc.view.backgroundColor = UIColor.white
        DrawerViewController.shareDrawer?.LeftViewController(didSelectController: vc)
        
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
