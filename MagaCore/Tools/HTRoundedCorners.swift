//
//  Hvar_troundedCorners.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTRroundedCorners: Shape {
  var var_tl: CGFloat = 0.0
  var var_tr: CGFloat = 0.0
  var var_bl: CGFloat = 0.0
  var var_br: CGFloat = 0.0

  func path(in rect: CGRect) -> Path {
    var path = Path()

    let var_tl = min(min(self.var_tl, rect.width/2), rect.height/2)
    let var_tr = min(min(self.var_tr, rect.width/2), rect.height/2)
    let var_bl = min(min(self.var_bl, rect.width/2), rect.height/2)
    let var_br = min(min(self.var_br, rect.width/2), rect.height/2)

    path.move(to: CGPoint(x: rect.minX + var_tl, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - var_tr, y: rect.minY))
    path.addArc(center: CGPoint(x: rect.maxX - var_tr, y: rect.minY + var_tr),
                radius: var_tr,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 0),
                clockwise: false)
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - var_br))
    path.addArc(center: CGPoint(x: rect.maxX - var_br, y: rect.maxY - var_br),
                radius: var_br,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false)
    path.addLine(to: CGPoint(x: rect.minX + var_bl, y: rect.maxY))
    path.addArc(center: CGPoint(x: rect.minX + var_bl, y: rect.maxY - var_bl),
                radius: var_bl,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false)
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + var_tl))
    path.addArc(center: CGPoint(x: rect.minX + var_tl, y: rect.minY + var_tl),
                radius: var_tl,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false)

    return path
  }
}

struct HTRroundedCorners_Previews: PreviewProvider {
    static var previews: some View {
      HTRroundedCorners()
    }
}
