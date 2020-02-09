//
//  HomeService.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/7.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class HomeService: BaseTableViewService {
    func getInfoArray(dic:Dictionary<String,Any>) -> (Array<Any>) {
        var reArray = Array<Any>()
        let dbDic = Dictionary<String,Any>()
        let HomeCell = "HomeCell"
        let data1 = dic["data"]
        if let data2 = data1 {
            let data3 = data2 as! Dictionary<String,Any>
            let list1 = data3["list"]
            if let list2 = list1 {
                let list3 = list2 as! Array<Any>
                for dict in list3 {
                    let dict1 = dict as! Dictionary<String,Any>
                    reArray.append(YYCreator .createCommon3LblCellVo(cellName: HomeCell, lbl1: dict1["name"] as! String, lbl2: dict1["headimg"] as! String, lbl3: dict1["description"] as! String, dbDic: dbDic))
                }
            }   
        }
        return reArray
    }
}
