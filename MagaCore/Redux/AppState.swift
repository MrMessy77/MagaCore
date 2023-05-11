//
//  State.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/9.
//

import Foundation
import ReSwift

struct AppState {
  var animeState: AnimeState = .init()
}

struct AnimeState {
  var var_banners: [HTAnimeModel]?
  var var_homeSubjects: [HTHomeSubjectModel]?
  var var_title: String? = "aaa"
}
