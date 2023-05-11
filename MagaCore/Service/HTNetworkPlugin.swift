//
//  HTNetworkPlugin.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/10.
//

import Foundation
import Moya

/*
 Moya默认有4个插件分别为：
 AccessTokenPlugin 管理AccessToken的插件
 CredentialsPlugin 管理认证的插件
 NetworkActivityPlugin 管理网络状态的插件
 NetworkLoggerPlugin 管理网络log的插件
 */
// 插件,实现pluginType可以实现在网络请求前转菊花，请求完成结束转菊花，或者写日志等功能
struct HTNetworkPlugin: PluginType {

  /// Called to modify a request before sending.(可进行数据加密等)
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    return request
  }

  /// Called immediately before a request is sent over the network (or stubbed).（可进行网络等待，loading等）
  func willSend(_ request: RequestType, target: TargetType) {

  }

  /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.（loading结束等）
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {

  }

  /// Called to modify a result before completion.(可进行数据解密等)
  func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
    return result
  }

}
