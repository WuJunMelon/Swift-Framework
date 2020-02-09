//
//  BaseTemplateVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class BaseTemplateVC: BaseVC {

    public var currentAction = String()
    public var viewDidApearAction = String()
    public var viewDidApearURL = String()
    public var pamDic = Dictionary<String,Any>()
    public var currentVCAction = String()
    public var viewWillApearURL = String()
    public var elementObjList = Array<Any>()

    public func getBaseTemplateService() -> (BaseTemplateService){
        return BaseTemplateService()
    }
    public func getBaseTemplateView() ->(BaseTemplateView){
        return BaseTemplateView()
    }
    public func getVCName() ->(String){
        return String()
    }
    
    override func initBaseView(baseView: BaseView) {
        self.view.addSubview(baseView)
        self.pamDic = Dictionary<String,Any>()
        if elementObjList.count == 0 {
            elementObjList = Array<Any>()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    

}
