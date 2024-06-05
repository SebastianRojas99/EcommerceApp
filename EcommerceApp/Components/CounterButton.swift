//
//  CounterButton.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 05/06/2024.
//

import SwiftUI

struct CounterButton: View {
    @Binding var value: Int
      @State var foreground: Color = .white
      @State var background: Color = .red
      
      private let size = 30.0
      private let x = 38.0
      private let y = 18.0
    var body: some View {
            ZStack {
              Circle()
                .fill(background)
                .frame(width: size * widthMultplier(), height: size, alignment: .center)
                .position(x: x, y: y)
              
              if hasTwoOrLessDigits() {
                Text("\(value)")
                  .foregroundColor(foreground)
                  .bold()
                  .font(.system(size: 20))
                  .position(x: x, y: y)
              } else {
                Text("99+")
                  .foregroundColor(foreground)
                  .font(Font.caption)
                  .frame(width: size * widthMultplier(), height: size, alignment: .center)
                  .position(x: x, y: y)
              }
            }
            .opacity(value == 0 ? 0 : 1)
          }
    func hasTwoOrLessDigits() -> Bool {
        return value < 100
      }
      
      func widthMultplier() -> Double {
        if value < 10 {
          // one digit
          return 1.0
        } else if value < 100 {
          // two digits
          return 1.5
        } else {
          // too many digits, showing 99+
          return 2.0
        }
      }
    }
    



