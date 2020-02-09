//
//  BaseTableViewVo.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class BaseTableViewVo: BaseTemplateVo {
    
    public var cellVoArray = Array<Any>()
    public var dataArray:Array<Any> = Array<Any>()

//    override init() {
////        super.init()
////        if self.dataArray == nil {
////            self.dataArray = Array<Any>()
////        }
//    }
    
    
    func initIconCellDataArray(cellName:String,cellIcon:String,cellLabel:String,cellValue:String) -> () {
        if dataArray == nil {
            dataArray = Array<Any>()
        }
        let dbDic = Dictionary<String,Any>()
        let cellVo = YYCreator.createIconCellVo(cellName: cellName, cellIcon: cellIcon, cellLabel: cellLabel, cellValue: cellValue, dbDic: dbDic)
        self.dataArray.append(cellVo)
        
    }
    
}


