//
//  BaseVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit
import Alamofire

class BaseVC: CoreVC {
    
    public var requestWithURLMsg = String()
    public var requestWithURLDic = Dictionary<String,Any>()
    public var requestWithURLRstCode = String()
    public var errorMsg = NSError()
    public var requestURL = String()
    
    public func initBaseView(baseView:BaseView){
        self.view.addSubview(baseView)
    }
    public func initBaseVo(baseVo:BaseVo){
        var vo = baseVo//转为变量
        vo = BaseVo.init()
    }
    public func initBaseView(){
    }
    public func initBaseVo(){
        
    }
    public func initService(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initBaseVo()
        initBaseView()
        initService()
    }

}

extension BaseVC{
    //默认是post
    public func requestWithURL(url:String,pamDic:Dictionary<String,Any>,loadingText:String){
        requestWithURLWithLoadingText(url: url, pamDic: pamDic, loadingText: loadingText)
    }
    
    private func requestWithURLWithLoadingText(url:String,pamDic:Dictionary<String,Any>,loadingText:String){
        //网络请求
        /*
         get
         let urlStr = "http://onapp.yahibo.top/public/?s=api/test/list"
         Alamofire.request(urlStr).responseJSON { (response) in
             switch response.result {
             case .success(let json):
                 print(json)
                 break
             case .failure(let error):
                 print("error:\(error)")
                 break
             }
         }
         */
        //post
        Alamofire.request(url, method: .post, parameters: pamDic).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                print(json)
                self.requestWithURLDic = json as! [String : Any]
                self.handleRequestWithURLSuccess(url: url)
                break
            case .failure(let error):
                print("error:\(error)")
                self.errorMsg = error as NSError
                self.handleRequestWithURLFailure(url: url)
                break
            }
        }
    }
    //json--->>NSDictionary
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
     
        let jsonData:Data = jsonString.data(using: .utf8)!
     
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    @objc public func handleRequestWithURLProgress(url:String){
        
    }
    @objc public func handleRequestWithURLFailure(url:String){
        
    }
    @objc public func handleRequestWithURLSuccess(url:String){
        
    }
    
    
}
