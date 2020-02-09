//
//  YYCreator.swift
//  Swift-Framework
//
//  Created by wujun on 2019/11/24.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit
import Kingfisher

class YYCreator: NSObject {
    
    static func createIconCellViewMap(cellName:String,cellIcon:String,cellLabel:String,cellValue:String) -> (Dictionary<String,Any>) {
        var hallMap = Dictionary<String,Any>()
        hallMap["cellIcon"] = cellIcon
        hallMap["cellLabel"] = cellLabel
        hallMap["cellValue"] = cellValue
        return hallMap
    }
    
    static func createIconCellViewMap(cellIcon:String,cellLabel:String,cellValue:String) -> Dictionary<String, Any> {
        var hallMap = Dictionary<String,Any>()
        hallMap["cellIcon"] = cellIcon
        hallMap["cellLabel"] = cellLabel
        hallMap["cellValue"] = cellValue
        return hallMap
    }
    
    static func createIconCellVo(cellName:String,cellIcon:String,cellLabel:String,cellValue:String,dbDic:Dictionary<String, Any>) -> (BaseTableCellVo) {
        let cellVoDic = YYCreator.createIconCellViewMap(cellIcon: cellIcon, cellLabel: cellLabel, cellValue: cellValue)
        let cellVo = BaseTableCellVo.init(cellName: cellName, cellDataDic: cellVoDic, dbDic: dbDic)
        return cellVo
    }
    
    static func createCommon3LblCellVo(cellName:String,lbl1:String,lbl2:String,lbl3:String,dbDic:Dictionary<String,Any>) -> BaseTableCellVo {
        let cellVoDic = YYCreator .createCommon3LblCellViewMap(lbl1: lbl1, lbl2: lbl2, lbl3: lbl3)
        let cellVo = BaseTableCellVo.init(cellName: cellName, cellDataDic: cellVoDic, dbDic: dbDic)
        return cellVo
    }
    static func createCommon3LblCellViewMap(lbl1:String,lbl2:String,lbl3:String) -> Dictionary<String,Any> {
        var hallMap = Dictionary<String,Any>()
        hallMap["lbl1"] = lbl1
        hallMap["lbl2"] = lbl2
        hallMap["lbl3"] = lbl3
        return hallMap
    }
    
    class func setCommon3LblViewMap(homeCell:HomeCell,vo:BaseTableCellVo){
        homeCell.titleLbl.text = vo.cellDataDic["lbl1"] as? String
        homeCell.detailLbl.text = vo.cellDataDic["lbl3"] as? String
        let url = vo.cellDataDic["lbl2"] as! String
        homeCell.icon.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "flower"), options: nil, progressBlock: { (receviveeSize, totalSize) in
        }) { (image, error, cacheType, imageURL) in
        }
    }
}
