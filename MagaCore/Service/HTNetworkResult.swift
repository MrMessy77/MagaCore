//
//  HTNetworkResult.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/10.
//

import Foundation
import Moya

struct HTNetworkResult<M: Decodable> {

  var var_data: M?
  var var_status: String
  var var_message: String?

  init(json: [String: Any]) {
    var_status = json["status"] as? String ?? "500"
    var_message = json["message"] as? String
    var_data = parseData(jsonObj: json["data"])
  }

  init(errorMsg: String?) {
    var_status = "500"
    var_message = errorMsg
  }

  /// 解析数据
  func parseData(jsonObj: Any?) -> M? {
    /// 判断是否为nil
    guard let dataObj = jsonObj else {
      return nil
    }

    /// 判断是否为NSNull
    guard !(dataObj as AnyObject).isEqual(NSNull()) else {
      return nil
    }

    /// 本身为M类型，直接赋值
    if let dataObj = dataObj as? M {
      return dataObj
    }

    /// 转模型
    let jsonData = try? JSONSerialization.data(withJSONObject: dataObj, options: .prettyPrinted)
    guard let data = jsonData else { return nil }
    do{
      return try JSONDecoder().decode(M.self, from: data)
    } catch {
      print(error)
      return nil
    }
  }
}

//给Result增加一个扩展方法
extension Result where Success: Response, Failure == MoyaError {
  func mapNetworkResult<M>(_ type: M.Type) -> HTNetworkResult<M> where M: Decodable {
    switch self {
    case .success(let response):
      do {
        guard let json = try response.mapJSON() as? [String: Any] else {
          /// 不是JSON数据
          return HTNetworkResult(errorMsg: "服务器返回的不是JSON数据")
        }
        return HTNetworkResult(json: json)
      } catch {
        /// 解析出错
        return HTNetworkResult(errorMsg: error.localizedDescription)
      }
    case .failure(let error):
      /// 请求出错
      return HTNetworkResult(errorMsg: error.errorDescription)
    }
  }
}
