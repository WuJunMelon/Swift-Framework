//
//  CommonUtil.swift
//  Swift-Framework
//
//  Created by wujun on 2020/2/7.
//  Copyright © 2020 wujun. All rights reserved.
//

import UIKit

class CommonUtil: NSObject {
    
    static func getArrayCount(inArray:Array<Any>) -> (NSInteger){
        if inArray == nil {
            return 0
        }
        let selRow = NSNumber.init(value: inArray.count)
        return selRow.intValue
    }
    
    static func addDataToNSMutableArray(trgArray:Array<Any>,inArray:Array<Any>) -> (Array<Any>) {
        var arr = trgArray
        if trgArray == nil || inArray == nil {
            let array = Array<Any>()
            return array
        }
        for item in inArray {
            arr.append(item)
        }
        return arr
    }
}
