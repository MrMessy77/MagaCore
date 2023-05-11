//
//  HTNetworkService.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/10.
//

import Foundation
import Moya

enum HTNetworkService {
  case homeData(id: String, p1: String)
}

// MARK: - TargetType Protocol Implementation
extension HTNetworkService: TargetType {
  var baseURL: URL { return URL(string: "http://54.187.6.80")! }
  var path: String {
    switch self {
    case .homeData(_, _):
      return "/264/"
    }
  }
  var method: Moya.Method {
    return .post
  }
  var task: Task {
    var params: [String: Any] = [:]
    params["apns_id"] = "8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93"
    params["app_id"] = "96"
    params["app_ver"] = "1.0.0"
    params["brand"] = "iPhone"
    params["country"] = "US"
    params["device"] = "iOS"
    params["deviceNo"] = "276E0495-66F6-417B-92FA-66EF0DC69DD4"
    params["idfa"] = "276E0495-66F6-417B-92FA-66EF0DC69DD4"
    params["imsi"] = "51502"
    params["installTime"] = "1676455895"
    params["lang"] = "en"
    params["model"] = "iPhone10,3"
    params["os_ver"] = "16.1"
    params["r1"] = "100"
    params["reg_id"] = "0"
    params["resolution"] = "1125x2436"
    params["simcard"] = "1"
    params["timezone"] = "8"
    params["token"] = "1"
    params["vp"] = "0"

    switch self {
    case let .homeData(id, p1):
      params["id"] = id
      params["p1"] = p1
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }
  var headers: [String: String]? {
    return [:]
  }
}

// MARK: - Helpers
private extension String {
  var urlEscaped: String {
    addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }

  var utf8Encoded: Data {
    Data(self.utf8)
  }
}
