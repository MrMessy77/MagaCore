//
//  HTCoverView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/4.
//

import SwiftUI

struct HTCoverView: View {

  var var_showAgeLimit: Bool = false
  var var_showVIP: Bool = true
  var var_showCAM: Bool = false
  var var_showDUB: Bool = true
  var var_showAdded: Bool = true
  var var_cornerRadius: CGFloat = 6
  var var_width: CGFloat = 108
  var var_height: CGFloat = 160

  var body: some View {
    ZStack(alignment: .top){
      Image("cover_default")
        .resizeToFit()
      VStack{
        HStack{
          if (var_showAgeLimit) {
            Image("18+")
              .frame(width: 30, height: 18)
          }
          if (var_showVIP) {
            Image("cover_vip")
              .frame(width: 26, height: 20)
          }

          Spacer()

          if(var_showCAM) {
            HStack{
              Text("CAM")
                .font(.system(size: 10))
                .fontWeight(.bold)
            }
            .frame(width: 38, height: 16)
            .background(Color.white)
            .cornerRadius(2)
            .offset(x: -6, y: 6)
          }

          if (var_showDUB) {
            HStack{
              Text("DUB")
                .font(.system(size: 10))
                .foregroundColor(Color.white)
            }
            .frame(width: 38, height: 16)
            .background(Color(hex: "#4F40BD"))
            .cornerRadius(2)
            .offset(x: -6, y: 6)
          }
        }
        Spacer()

        if(var_showAdded) {
          VStack(alignment: .leading){
            ZStack {
              Image("rectangle")
              Text("Added")
                .font(.system(size: 9))
                .foregroundColor(.white)
            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }

        ZStack(alignment: .trailing) {
          Image("cover_gradient")
            .resizeToFit()
          Text("Ep 10")
            .font(.system(size: 10))
            .foregroundColor(.white)
            .offset(x: -6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    .frame(width: var_width, height: var_height)
    .cornerRadius(var_cornerRadius)
    .clipped()
    .onTapGesture {
      print("aaa")
    }
  }
}

struct HTCoverView_Previews: PreviewProvider {
  static var previews: some View {
    HTCoverView()
  }
}
