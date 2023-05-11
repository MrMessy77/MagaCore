//
//  HTPremiumPlanSection.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/8.
//

import SwiftUI

struct HTPremiumPlanSection: View {
    var body: some View {
      HStack{
        Text("CURRENT PLAN")
          .font(.system(size: 20))
        Spacer()
        VStack(alignment: .trailing){
          Text("Monthly")
            .font(.system(size: 14))
            .fontWeight(.bold)
          Spacer().frame(height: 3)
          Text("Cancels on:july 3,2022")
            .font(.system(size: 12))
        }
      }
      .padding(.horizontal, 12)
      .padding(.vertical, 10)
      .frame(maxWidth: .infinity)
      .background(LinearGradient(colors: [Color(hex: "#CBDEF5"), Color(hex: "#B5CBEB")], startPoint: .leading, endPoint: .trailing))
      .cornerRadius(6)
    }
}

struct HTPremiumPlanSection_Previews: PreviewProvider {
    static var previews: some View {
        HTPremiumPlanSection()
    }
}
