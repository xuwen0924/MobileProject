//
//  HomePageViewController.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/20.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488
    
    var tableView: UITableView!
    var dataArray: [WeiboListModel] = []
    
    var cellHeights = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化视图
        initView();
        
        //请求数据
        requestData();
    }
    
    func initView() -> Void {
        view.backgroundColor = UIColor.white
        tableView = UITableView(frame: CGRect(x: 0,y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.addSubview(tableView)
    }
    
    func requestData() -> Void {
        WeiboListModel.fetchPublicWeiBo { (dataArray) in
            print(dataArray)
            print("success")
            self.dataArray = dataArray
            self.cellHeights.append(self.kCloseCellHeight)
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        if indexPath.row < dataArray.count {
            let model: WeiboListModel = dataArray[indexPath.row]
            cell.textLabel?.text = model.text
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
