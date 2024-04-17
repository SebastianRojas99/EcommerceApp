//
//  Home.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView{
            VStack{
                //how to create a header
                
                HStack{
                    
                    Text("Shop your favorite **Sneakers**")
                        .font(.system(size: 36))
                        .padding(.trailing)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 70,height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 200).stroke(.green,lineWidth: 270).opacity(0.4))
                        
                }
                //Categories
                CategoryListView()
                
            }.padding(12)
        }//vistas
        
    }
}

#Preview {
    Home()
}
