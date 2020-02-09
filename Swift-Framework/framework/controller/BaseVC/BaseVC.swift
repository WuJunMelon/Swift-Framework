//
//  BaseVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit
import Alamofire

enum Request {
    case GET
    case POST
    case DOWNLOAD
    case UPLOAD
}

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
    public func requestWithURL(url:String,pamDic:Dictionary<String,Any>,loadingText:String,request:Request){
        switch request {
        case .GET:
            requestGetWithURLWithLoadingText(url: "", pamDic: pamDic, loadingText: "")
            break
        case .POST:
            requestWithURLWithLoadingText(url: url, pamDic: pamDic, loadingText: loadingText)
            break
        case .DOWNLOAD:
            requestDownloadWithURLWithLoadingText(url: "", loadingText: "")
            break
        case .UPLOAD:
            requestUploadWithURLWithLoadingText(url: url, loadingText: "")
            break
        default:
            break
        }
    }
    
    //上传表单
//    能够同时上传其他参数和图片
//    image[]后台通过image获取到的是一个数组
//    fileName图片名称
//    在result中监听上传进度，获取上传结果
    func requestUploadWithURLWithLoadingText(url:String,loadingText:String) {
        
        let imgArr:Array = [UIImage.init(named: "headimg"),UIImage.init(named: "headimg")]
        Alamofire.upload(multipartFormData: { (formData) in
            formData.append("hibo".data(using: .utf8)!, withName: "name")
            formData.append("123456".data(using: .utf8)!, withName: "password")
            for i in 0 ... imgArr.count-1 {
                let data = imgArr[i]!.pngData()
                let fileName = "image_\(i).png"
                formData.append(data!, withName: "image[]", fileName: fileName, mimeType: "image/png")
            }
        }, to: url) { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (progress) in
                    print(progress)
                }).responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let json):
                        print(json)
                        break
                    case .failure(let error):
                        print("error:\(error)")
                        break
                    }
                })
                break
            case .failure(let error):
                print(error)
                break
            }
            print("result:\(result)")
        }
    }
    //下载
    private func requestDownloadWithURLWithLoadingText(url:String,loadingText:String) {
        let videoUrl = "http://onapp.yahibo.top/public/videos/video.mp4"
        Alamofire.download(videoUrl, to: { (videoUrl, response) -> (destinationURL: URL, options: DownloadRequest.DownloadOptions) in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let time = Date().timeIntervalSince1970
            let fileURL = documentsURL.appendingPathComponent("\(time).mp4")
            print("沙盒路径：\(documentsURL)")
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }).downloadProgress { (progress) in
            print(progress)
        }
    }
    
    private func requestGetWithURLWithLoadingText(url:String,pamDic:Dictionary<String,Any>,loadingText:String){
        let urlStr = "http://onapp.yahibo.top/public/?s=api/test/list"
        Alamofire.request(urlStr).responseJSON { (response) in
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
    
    private func requestWithURLWithLoadingText(url:String,pamDic:Dictionary<String,Any>,loadingText:String){
        //网络请求
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
