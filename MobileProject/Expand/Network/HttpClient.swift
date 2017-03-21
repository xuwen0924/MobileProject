//
//  HttpClient.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit
import Alamofire

class HttpClient {
    
    var request:Request?
    
    /// 是否是网络错误
    var isNetError = false
    
    /// 回调信息
    var isLoading = false
    var rawData: Data?
    var resultDic = [String:AnyObject]()
    // 回调错误提示
    var errorInfo = ""
    
    private var startTime : Date?
    private var spendTime : TimeInterval = 0.0
    
    /**
     api接口
     */
    func methodName() -> String {
        return ""
    }
    
    /**
     请求类型，默认Post请求
     */
    func reqeustType() -> String {
        return "POST"
    }
    
    /**
     默认错误信息
     */
    func errorMessage() -> String? {
        return nil
    }
    
    /**
     请求参数
     */
    func requestParams() -> [String:AnyObject]? {
        return nil
    }
    
    /*!
     上传文件
     
     - returns: 文件名和数据
     */
    func uploadFile() -> (key:String,data:NSData)? {
        return nil
    }
    
    /**
     开始加载数据
     */
    func loadData() {
        startTime = Date()
        //fire()
    }
    
    /**
     取消请求
     */
    func cancelRequest() {
        request?.cancel()
    }
    
    /**
     开始请求
     */
    class func getRequest(url: String, params: [String: String], successHandler: ((_ response: [String:AnyObject]) -> Void)?, failedHandler: ((_ error: String) -> Void)?) {
        
        // 构造请求基本参
        var paramsDic = params
        paramsDic["apptoken"] = ""
        paramsDic["version"] = "1.0"
        paramsDic["method"] = ""
        paramsDic["os"] = "ios"
        
        //打印日志
        let logStr = String.init(format: "%@%@%@", String(describing: self.self), " Send Request With Param :\n", "params:\(paramsDic.description)\n")
        print("\(logStr)")
        
        Alamofire.request(url, parameters: paramsDic, encoding: URLEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                if let responseObject = response.result.value as? [String:AnyObject] {

                    //打印日志
                    let logStr = String.init(format: "%@%@%@", String(describing: self.self), " Received Response :\n", "params:\(responseObject.description)\n")
                    print("\(logStr)")
                    
                    successHandler?(responseObject)
                    
                }else{
                    failedHandler?("返回数据异常")
                }
            case .failure(let error):
                print(error)
                failedHandler?("返回数据异常")
            }
        }
    }
    
    // 上传图片
    class func urlRequestWithComponents(urlString:String, parameters:[String: AnyObject], imageData:(key:String,data:Data)?) -> Void {
        
        let image: UIImage = UIImage(named: "xxx")!
        let imageData = UIImagePNGRepresentation(image)!
        let imageData1 = UIImagePNGRepresentation(image)!
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "1")
                multipartFormData.append(imageData1, withName: "2")
        },
            to: "https://httpbin.org/post",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        })
    }
}

