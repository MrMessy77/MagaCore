//
//  HTAnime.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/10.
//

import Foundation

struct HTAnimeModel: Codable {
  var id: String
  var title: String?// 剧名
  var title_2: String?
  var cover: String?// 封面
  var age: String?// 年龄分级,1代表18+，其他为非18+
  var rate: String?// 评分
  var quality: String?// 清晰度，CAM、HD等
  var ep: String?// 集数
  var new_flag: String?// 是否有更新
  var finished: String?// 是否完结：1是，0否
  var sub: String?// 线路SUB是否存在:1存在，0不存在
  var dub: String?// 线路DUB是否存在:1存在，0不存在
}

struct HTHomeSubjectModel: Codable {
  var name: String?// 专题显示标题
  var seeall: String?// 专题右侧seeall按钮是否显示：1显示，0不显示
  var animes: [HTAnimeModel]

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decodeIfPresent(String.self, forKey: .name)
    self.seeall = try container.decodeIfPresent(String.self, forKey: .seeall)
    self.animes = try container.decode([HTAnimeModel].self, forKey: .animes)
  }
}
