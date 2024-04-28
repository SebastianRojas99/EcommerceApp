//
//  ContentView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var cartManager = CartvViewModel()
    var body: some View {
        ZStack(alignment:.bottom) {
            Home()
                .environment(cartManager)
            
            if cartManager.products.count > 0{
                HStack{
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.green)
                        .clipShape(Circle())
                        .padding(.horizontal)
                    VStack(alignment:.leading,spacing: 10){
                        Text("Cart").bold().foregroundStyle(.white)
                        Text("\(cartManager.products.count) item").foregroundStyle(.gray)
                        
                    }
                    Spacer()
                    Image(cartManager.products.last!.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60,height: 60)
                        .background(.white)
                        .clipShape(Circle())
                }
                .padding(30)
                .frame(width: .infinity,height: 80)
                .background(.black)
                .clipShape(.rect(cornerRadius: 30))
                 
            }
        }
        
    }
}

#Preview {
    ContentView()
}
