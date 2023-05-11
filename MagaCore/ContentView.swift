//
//  ContentView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/4/28.
//

import SwiftUI
import CoreData
import ReSwift

struct ContentView: View {
  @EnvironmentObject private var store: AppStore

  init() {
    UITableView.appearance().tableFooterView = UIView()
    UITableView.appearance().separatorStyle = .none
  }

  var body: some View {
    ZStack {
      TabBar()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(AppStore())
  }
}
