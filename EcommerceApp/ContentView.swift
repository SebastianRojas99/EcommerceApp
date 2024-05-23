//
//  ContentView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var cartManager = CartvViewModel()
    @State var productManager = ProductViewModel(productList: productList)
    
    var body: some View {
        NavigationStack{
    
            VStack(alignment:.leading) {
                Home()
                    .environment(cartManager)
                
                NavigationLink{
                    CartView()
                        .environment(cartManager)
                        .environment(productManager)
                }label: {
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
                                .padding(8)
                                .frame(width: 60,height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading,-60)
                        }
                        .padding(30)
                        .frame(maxWidth:.infinity)
                        .frame(height: 80)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 30))
                         
                        
                    }
                }
                
                
            }
        }.foregroundStyle(.black)
    }
}

#Preview {
    ContentView()
}
