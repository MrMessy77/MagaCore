//
//  AnimeReducer.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import ReSwift

enum AnimeReducer {
  static var reducer: Reducer<AnimeState> {
    return { action, state in
      var state = state ?? AnimeState()
      guard let action = action as? AnimeAction else {
        return state
      }
      switch action {
      case .homeAnimes(var_title: let var_title):
        state.var_title = var_title
        return state
      }
    }
  }
}
