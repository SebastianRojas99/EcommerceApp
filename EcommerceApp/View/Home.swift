//
//  Home.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 17/04/2024.
//

import SwiftUI

struct Home: View {
    
    @State var selectedCategory = ""
    
    var body: some View {
        
        ScrollView{
            VStack{
                //how to create a header
                
                HStack{
                    
                    Text("Shop your favorite **Sneakers**")
                        .font(.system(size: 30))
                        .padding(.trailing)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 70,height: 90)
                        .overlay(RoundedRectangle(cornerRadius: 200).stroke(.green,lineWidth: 270).opacity(0.4))
                        
                }.padding(12)
                //Categories
                CategoryListView
                
                //Collection
                
                HStack{
                    
                        Text("**\(selectedCategory)** shoes").font(.system(size: 24))
                        Spacer()
                        Image(systemName: "arrow.right").imageScale(.large)
                    //Text("**Football** shoes").font(.system(size: 24))
                    //Text("**Basketball** shoes").font(.system(size: 24))
                }.padding(.horizontal,12)
                    .padding(.vertical,6)
                
                
            }
        }//vistas
        
    }
    var CategoryListView: some View {
         
        HStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(categoryList,id: \.self){ item in
                            Button{
                                selectedCategory = item.title
                            }label: {
                                HStack{
                                    if item.title !=  "All"{
                                        Image(systemName: item.icon).foregroundStyle(selectedCategory == item.title ? .brown : .black)
                                    }
                                    Text(item.title)
                                }
                            }
                            .padding()
                            .background(selectedCategory == item.title ? .green.opacity(0.3) : .gray.opacity(0.2))
                            .foregroundStyle(.black)
                            .clipShape(.capsule)
                        }
                    }
                }
        }.padding(.horizontal,12)
        }

}



#Preview {
    Home()
}
