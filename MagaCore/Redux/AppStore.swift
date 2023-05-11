//
//  Store.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Combine
import Foundation
import ReSwift
import ReSwiftThunk

final class AppStore: StoreSubscriber, DispatchingStoreType, ObservableObject {
  private let store: Store<AppState>
  var state: AppState { store.state }
  private(set) var objectWillChange: ObservableObjectPublisher = .init()

  init() {
    self.store = .init(
      reducer: AppReducer.reducer,
      state: .init(),
      middleware: [
        createLoggingMiddleware(),
        createThunkMiddleware()
      ]
    )
    store.subscribe(self)
  }

  deinit {
    store.unsubscribe(self)
  }

  func newState(state: AppState) {
    objectWillChange.send()
  }

  func dispatch(_ action: Action) {
    if Thread.isMainThread {
      store.dispatch(action)
    } else {
      DispatchQueue.main.async { [store] in
        store.dispatch(action)
      }
    }
  }
}
