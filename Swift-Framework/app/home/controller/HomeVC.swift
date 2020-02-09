//
//  HomeVC.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/7.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class HomeVC: BaseTableViewVC {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let urlStr = "http://onapp.yahibo.top/public/?s=api/test/list"
    
    lazy var homeVo:HomeVo = {
        let vo = HomeVo()
        return vo
    }()
    lazy var homeService:HomeService = {
        let service = HomeService()
        return service
    }()
    
    var homeView:HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.
    }
    override func initBaseView() {
        self.homeView = HomeView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        super.initBaseView(baseTableView: self.homeView)
        self.pamDic = ["name":"hibo","password":"123456"]
        self.requestWithURL(url: urlStr, pamDic: self.pamDic , loadingText: "loading...")
    }
    override func initService() {
        self.homeService = HomeService()
    }
    override func initBaseVo() {
        self.homeVo = HomeVo()
    }
    
    override func getBaseTableViewVo() -> BaseTableViewVo {
        return self.homeVo
    }
    override func getBaseTableView() -> (BaseTableView) {
        return self.homeView
    }
    override func getBaseTemplateService() -> (BaseTemplateService) {
        return self.homeService
    }
    override func getVCName() -> (String) {
        return "HomeVC"
    }
    
    //演示pull代码再本地后的冲突和解决冲突
    //本地修改的代码
    func test() -> () {
        
    }
    
    override func handleRequestWithURLSuccess(url: String) {
        print("handleRequestWithURLSuccess",self.requestWithURLDic)
        if url == urlStr {
            self.homeVo = self.homeVo.initByDic(dic: self.requestWithURLDic)
            self.homeView.reloadView(baseTableViewVo: self.homeVo)
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let baseTableCellVo = super.getBaseTableCellVoByIndexPath(indexPath: indexPath, baseTableViewVo: self.homeVo)
        var homeCell:HomeCell!
        if baseTableCellVo != nil {
            if "HomeCell" == baseTableCellVo.cellName {
                let cell_ID = "HomeCell"
                tableView.register(HomeCell.self, forCellReuseIdentifier: cell_ID)
                var cell = tableView.dequeueReusableCell(withIdentifier: cell_ID) as? HomeCell
                if cell==nil {
                    cell = HomeCell(style: .subtitle, reuseIdentifier: cell_ID)
                }
                cell?.setCellDataByCellVo(baseTableCellVo: baseTableCellVo)
                return cell!
            }
        }
        return homeCell
    }
}
