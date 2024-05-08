//
//  DropViewDelegate.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 08/05/2024.
//

import Foundation
import SwiftUI


struct DropViewDelegate:DropDelegate{
    
    let destinationItem:ProductModel
    @Binding var products:[ProductModel]
    @Binding var draggedItem:ProductModel?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    func dropEntered(info: DropInfo) {
        if let draggedItem{
            let fromIndex = products.firstIndex(of: draggedItem)
            if let fromIndex{
                let toIndex = myCart.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex{
                    withAnimation{
                        self.products.move(fromOffsets: IndexSet(integer: fromIndex), toOffset:(toIndex > fromIndex ? (toIndex + 1) : toIndex))
                    }
                }
            }
        }
    }
    
    
}
