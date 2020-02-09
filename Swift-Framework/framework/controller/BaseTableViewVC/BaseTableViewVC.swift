//
//  BaseTableViewVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class BaseTableViewVC: BaseTemplateVC ,UITableViewDelegate,UITableViewDataSource{
    
    public func getTableViewRowHeight() ->(CGFloat){
        return 60.0
    }
    
    public func initBaseView(baseTableView:BaseTableView) ->(){
        super.initBaseView(baseView: baseTableView)
        baseTableView.baseTableView.delegate = self
        baseTableView.baseTableView.dataSource = self
        baseTableView.baseTableView.rowHeight = self.getTableViewRowHeight()
    }
    public override func initBaseVo(baseVo:BaseVo) ->(){
        var vo = baseVo
        vo = BaseVo()
    }
    
    public func getBaseTableCellVoByIndexPath(indexPath:IndexPath,baseTableViewVo:BaseTableViewVo) ->(BaseTableCellVo){
        if baseTableViewVo != nil && baseTableViewVo.dataArray != nil && baseTableViewVo.dataArray.count >= indexPath.row {
            var cellVo = baseTableViewVo.dataArray[indexPath.row] as! BaseTableCellVo
            return cellVo
        }else{
            if baseTableViewVo == nil{
                print("getBaseTableCellVoByIndexPath error baseTableViewVo == nil")
            }
            if baseTableViewVo.dataArray == nil{
                print("getBaseTableCellVoByIndexPath error baseTableViewVo.dataArray == nil")
            }
            if baseTableViewVo.dataArray.count < indexPath.row{
                print("getBaseTableCellVoByIndexPath error [baseTableViewVo.dataArray count] < indexPath.row")
                print("baseTableViewVo.dataArray.count",baseTableViewVo.dataArray.count)
                print("indexPath.row",indexPath.row)

            }
        }
        let cellDataDic = Dictionary<String,Any>()
        let dbDic = Dictionary<String,Any>()
        return BaseTableCellVo.init(cellName: "", cellDataDic: cellDataDic, dbDic: dbDic)
    }
    public func getBaseTableView() ->(BaseTableView){
        return BaseTableView()
    }
    override public func getBaseTemplateView() ->(BaseTemplateView){
        return getBaseTableView()
    }
    override func viewDidLayoutSubviews() {
//        var baseTableView = getBaseTableView()
//        if baseTableView != nil {
//            if baseTableView.baseTableView.responds(to: #selector(setSeparatorInset)) {
//                <#code#>
//            }
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //代理和数据源方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var baseTableViewVo = self.getBaseTableViewVo()
        print("dataArray.count......,baseTableViewVo",baseTableViewVo.dataArray.count,baseTableViewVo)
        if baseTableViewVo != nil {
            if baseTableViewVo.dataArray == nil {
                return 0
            }
            return baseTableViewVo.dataArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "UITableViewCell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)as? UITableViewCell
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        return cell!
    }
    
    
    func getBaseTableViewVo() -> BaseTableViewVo {
        return BaseTableViewVo()
    }
    

}
