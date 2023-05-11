//
//  HTFeedback.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/1.
//

import SwiftUI

struct HTFeedback: View {

  @State private var message = ""
  @Binding var var_desc: String

  var body: some View {
    HTNavigationBar{
      VStack(alignment: .leading, spacing: 0){
        ScrollView(showsIndicators: false){
          Spacer().frame(height: 10)
          VStack(alignment: .leading, spacing: 0){
            Text("Describe The Problem")
              .font(.custom("Helvetica-Bold", size: 14))
              .fontWeight(.heavy)
            Spacer().frame(height: 3)
            ZStack(alignment: .topLeading){
              TextEditor(text: $var_desc)
                .font(.system(size: 12))
                .autocapitalization(.words)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150, alignment: .topLeading)

              if (message.isEmpty) {
                Text("please describe your issue or suggestion in detail.")
                  .font(.system(size: 12))
                  .foregroundColor(Color(UIColor.placeholderText))
                  .padding(.top, 10)
              }
            }
          }
          .padding(15)
          .background(Color.white)
          .frame(maxWidth: .infinity)

          Spacer().frame(height: 10)
          VStack(alignment: .leading, spacing: 0){
            Text("Email Address")
              .font(.custom("Helvetica-Bold", size: 14))
              .fontWeight(.heavy)
            Spacer().frame(height: 3)
            TextField("please enter a proper valid email address.", text: $var_desc)
              .font(.system(size: 12))
              .multilineTextAlignment(.leading)
              .frame(maxWidth: .infinity, minHeight: 40, maxHeight: .infinity, alignment: .topLeading)
          }
          .padding(15)
          .background(Color.white)
          .frame(maxWidth: .infinity)

          Spacer().frame(height: 50)
          Button {

          } label: {
            Text("Submit")
              .font(.system(size: 14))
              .fontWeight(.bold)
              .foregroundColor(Color(hex: "#999999"))
          }
          .frame(maxWidth: .infinity, minHeight: 36)
          .background(Color.black.opacity(0.04))
          .clipShape(Capsule())
          .padding(.horizontal, 80)

          Spacer().frame(height: 20)
          Text("Or you can contact us at: wizmock@outlook.com")
            .font(.system(size: 12))
            .foregroundColor(Color(hex: "#999999"))
        }
        .frame(maxWidth: .infinity)
      }
      .background(Color(hex: "#f5f5f5"))
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    .ht_title(title: "Feedback")
  }
}

struct HTFeedbackTestView: View {
  @State var var_testDescText: String = ""

  var body: some View {
    HTFeedback(var_desc: $var_testDescText)
  }
}

struct HTFeedback_Previews: PreviewProvider {
  static var previews: some View {
    HTFeedbackTestView()
  }
}
