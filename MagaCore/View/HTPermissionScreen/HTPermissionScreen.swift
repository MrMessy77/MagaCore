//
//  HTPermissionScreen.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTPermissionScreen: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 0){
      VStack{
        ZStack(alignment: .bottomLeading){
          Image("permission_bg")
            .resizeToFit()
          VStack(alignment: .leading){
            Text("Stay Connected With Us")
              .font(.system(size: 36))
              .fontWeight(.bold)
              .frame(maxWidth: 300, alignment: .leading)
          }
          .padding(.leading, 20)
        }
      }

      VStack(alignment: .leading, spacing: 0){
        Text("Get notifications, you can receive the following messages in time")
          .font(.system(size: 12))
          .foregroundColor(Color(hex: "#999999"))
        HStack{
          Image("permission_icon1")
          Text("The latest popular animes")
            .font(.system(size: 12))
        }
        .padding(.top, 20)
        HStack{
          Image("permission_icon2")
          Text("Important news, APP updates and more")
            .font(.system(size: 12))
        }
        .padding(.top, 30)
        HStack{
          Image("permission_icon3")
          Text("Personalized Recommendations")
            .font(.system(size: 12))
        }
        .padding(.top, 30)
      }
      .padding(.leading, 22)
      .padding(.top, 15)
      .frame(maxWidth: .infinity, alignment: .leading)

      Spacer()

      HStack {
        Button {

        } label: {
          Text("Continue")
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, minHeight: 44)
        .background(Color(hex: "#FF6C3C"))
        .cornerRadius(6)
        .shadow(color: Color(hex: "#D76742").opacity(0.6), radius: 6, x: 0, y: 5)
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal, 25)

      Text("Manage your notifications in your phone settings")
        .font(.system(size: 11))
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
    }
    .padding(.bottom, 48)
    .background(Color(hex: "#f5f5f5"))
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    .edgesIgnoringSafeArea(.all)
  }
}

struct HTPermissionScreen_Previews: PreviewProvider {
  static var previews: some View {
    HTPermissionScreen()
  }
}
