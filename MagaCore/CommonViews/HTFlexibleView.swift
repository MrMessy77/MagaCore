//
//  HTFlexibleView.swift
//  MagaCore
//
//  Created by MrMessy on 2023/5/7.
//

import SwiftUI

struct HTFlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
  let data: Data
  let spacing: CGFloat
  let alignment: HorizontalAlignment
  let content: (Data.Element) -> Content
  @State private var availableWidth: CGFloat = 0
  @State var elementsSize: [Data.Element: CGSize] = [:]

  var body : some View {
    ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
      Color.clear
        .frame(height: 1)
        .readSize { size in
          availableWidth = size.width
        }

      VStack(alignment: alignment, spacing: spacing) {
        ForEach(computeRows(), id: \.self) { rowElements in
          HStack(spacing: spacing) {
            ForEach(rowElements, id: \.self) { element in
              content(element)
                .fixedSize()
                .readSize { size in
                  elementsSize[element] = size
                }
            }
          }
        }
      }

    }
  }

  func computeRows() -> [[Data.Element]] {
    var rows: [[Data.Element]] = [[]]
    var currentRow = 0
    var remainingWidth = availableWidth

    for element in data {
      let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

      if remainingWidth - (elementSize.width + spacing) >= 0 {
        rows[currentRow].append(element)
      } else {
        currentRow = currentRow + 1
        rows.append([element])
        remainingWidth = availableWidth
      }

      remainingWidth = remainingWidth - (elementSize.width + spacing)
    }

    return rows
  }
}

struct HTFlexibleView_Previews: PreviewProvider {
  static var previews: some View {
    HTFlexibleView(
      data: ["One Piece", "One", "Piece", "One 11", "Piece"],
      spacing: 16,
      alignment: .leading
    ) { item in
      Text(verbatim: item)
        .padding(8)
        .background(
          RoundedRectangle(cornerRadius: 8)
            .fill(Color.gray.opacity(0.2))
        )
    }
    .padding(.horizontal, 15)
  }
}
