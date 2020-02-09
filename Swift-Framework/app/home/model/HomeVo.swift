//
//  HomeVo.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/7.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class HomeVo: BaseTableViewVo {
    var homeService:HomeService!
    
//    override init() {
//        super.init()
//    }
    func initByDic(dic:Dictionary<String,Any>) -> Self! {
        self.homeService = HomeService()
        self.cellVoArray = self.homeService.getInfoArray(dic: dic)
        reloadDataArray()
        return self
    }
    
    func reloadDataArray() -> () {
        let totalCount = CommonUtil.getArrayCount(inArray: self.cellVoArray)
        self.dataArray.removeAll()
        self.dataArray = NSMutableArray.init(capacity: totalCount) as! Array<Any>
        self.dataArray = CommonUtil.addDataToNSMutableArray(trgArray: self.dataArray, inArray: self.cellVoArray)
    }
}
