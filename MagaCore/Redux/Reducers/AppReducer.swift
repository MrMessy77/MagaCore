//
//  AppReducer.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import ReSwift

enum AppReducer {
  static var reducer: Reducer<AppState> {
    return { action, state in
      var state = state ?? AppState()
      state.animeState = AnimeReducer.reducer(action, state.animeState)
      return state
    }
  }
}
