//
//  ProductDescriptionView.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 04/06/2024.
//

import SwiftUI

struct ProductDescriptionView: View {
    @State var product:ProductModel
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    
                    HStack{
                        DismissButton()
                    }
                    HStack{
                        Image(product.image)
                    }
                }
            }
            VStack{
                HStack{
                    Text(product.name)
                        .font(.largeTitle)
                        .bold()
                    Text("\(product.price)")
                        .font(.callout)
                        .foregroundStyle(.royal)
                }
                
            }
            
        }
        
    }
}

