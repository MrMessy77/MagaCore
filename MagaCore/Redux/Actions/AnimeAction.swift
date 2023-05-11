//
//  AnimeAction.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Moya

enum AnimeAction: Action {
  case homeAnimes(var_title: String?)

  static func ht_changeTitle() -> Thunk<AppState> {
    Thunk<AppState> { dispatch, _ in
      dispatch(AnimeAction.homeAnimes(var_title: "ccc"))
    }
  }

  // 获取首页数据
  static func ht_homeData() -> Thunk<AppState> {
    Thunk<AppState> { dispatch, _ in

      NetworkManager<HTAnimeModel>().request(.homeData(id: "3003138", p1: "1")){ (result) in
//        print("aaa")
//        print(result)
//        if let HTAnimeModel = result.data {
//          print("登录成功！")
//          let userMessage = "token: \(loginModel.token)" + "\n\nid: \(loginModel.user.id)" + "\n\nmobile: \(loginModel.user.mobile)"
//          print(userMessage)
//        } else {
//          //失败
//          print(result.info)
//        }
      }

    }
  }
}
