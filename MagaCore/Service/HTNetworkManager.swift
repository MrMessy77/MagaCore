//
//  HTNetworkManager.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import Moya

/// 超时时长
private var requestTimeOut: Double = 30

//这个closure存放了一些moya进行网络请求前的一些数据,可以在闭包中设置公共headers
private let endpointClosure = { (target: HTNetworkService) -> Endpoint in
  var endpoint: Endpoint = MoyaProvider.defaultEndpointMapping(for: target)
  return endpoint
}
//这个闭包是moya提供给我们对网络请求开始前最后一次机会对请求进行修改，比如设置超时时间（默认是60s），禁用cookie等
private let requestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<HTNetworkService>.RequestResultClosure) -> Void in

  do {
    var request = try endpoint.urlRequest()
    // 设置请求时长
    request.timeoutInterval = requestTimeOut
    // 打印请求参数
    if let requestData = request.httpBody {
      print("请求的url：\(request.url!)" + "\n" + "\(request.httpMethod ?? "")" + "发送参数" + "\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
    } else {
      print("请求的url：\(request.url!)" + "\(String(describing: request.httpMethod))")
    }

    if let header = request.allHTTPHeaderFields {
      print("请求头内容\(header)")
    }

    done(.success(request))
  } catch {
    done(.failure(MoyaError.underlying(error, nil)))
  }

}

private let networkProvider = MoyaProvider<HTNetworkService>(endpointClosure: endpointClosure, requestClosure: requestClosure, plugins: [HTNetworkPlugin()], trackInflights: false)


struct NetworkManager<M: Codable> {
  /// progress的回调
  typealias NetworkProgress = (CGFloat) -> Void
  /// 请求完成的回调
  typealias NetworkCompletion = (HTNetworkResult<M>) -> Void

  @discardableResult
  func request(_ target: HTNetworkService, progress: NetworkProgress? = nil, completion: @escaping NetworkCompletion) -> Cancellable {

    let task = networkProvider.request(target, callbackQueue: DispatchQueue.main) { progressResponse in
      progress?(CGFloat(progressResponse.progress))
    } completion: { result in
      //result转为NetworkResult结构体
      let networkResult = result.mapNetworkResult(M.self)
      completion(networkResult)
    }
    return task

  }
}
