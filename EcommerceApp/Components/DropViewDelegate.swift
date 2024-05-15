//
//  DropViewDelegate.swift
//  EcommerceApp
//
//  Created by Sebastian Marquez Rojas on 08/05/2024.
//

import Foundation
import SwiftUI

// Definición de la estructura DropViewDelegate que implementa el protocolo DropDelegate
struct DropViewDelegate:DropDelegate{
    
    // Producto destino de la operación de arrastrar y soltar
    let destinationItem:ProductModel
    // Lista de productos, es una variable de enlace (Binding), lo que significa que refleja los cambios en la vista
    @Binding var products:[ProductModel]
    // Producto que se está arrastrando, también es una variable de enlace
    @Binding var draggedItem:ProductModel?
    // Gestor del carrito, se pasa como parámetro en lugar de obtenerlo del entorno
    var cartManager: CartvViewModel

    // Inicializador personalizado para la estructura DropViewDelegate
    init(destinationItem: ProductModel, products: Binding<[ProductModel]>, draggedItem: Binding<ProductModel?>, cartManager: CartvViewModel) {
        // Asignación de los parámetros a las propiedades de la estructura
        self.destinationItem = destinationItem
        _products = products
        _draggedItem = draggedItem
        self.cartManager = cartManager
    }

    // Método que se llama cuando se actualiza la operación de arrastrar y soltar
    func dropUpdated(info: DropInfo) -> DropProposal? {
        // Propone una operación de movimiento para la operación de arrastrar y soltar
        return DropProposal(operation: .move)
    }
    
    // Método que se llama cuando se suelta el elemento arrastrado
    func performDrop(info: DropInfo) -> Bool {
        // Si hay un producto arrastrado
        if let product = draggedItem {
            // Añade el producto al carrito
            cartManager.addToCart(product: product)
        }
        // Resetea el producto arrastrado
        draggedItem = nil
        // Retorna true para indicar que la operación de arrastrar y soltar se ha completado con éxito
        return true
    }
    
    // Método que se llama cuando un elemento arrastrado entra en la zona de soltar
    func dropEntered(info: DropInfo) {
        // Si hay un producto arrastrado
        if let draggedItem = draggedItem {
            // Obtiene el índice del producto arrastrado en la lista de productos
            let fromIndex = products.firstIndex(of: draggedItem)
            // Si el producto arrastrado está en la lista de productos
            if let fromIndex = fromIndex {
                // Obtiene el índice del producto destino en el carrito
                let toIndex = myCart.firstIndex(of: destinationItem)
                // Si el producto destino está en el carrito y los índices son diferentes
                if let toIndex = toIndex, fromIndex != toIndex {
                    // Realiza una animación para mover el producto arrastrado a la posición del producto destino en la lista de productos
                    withAnimation {
                        self.products.move(fromOffsets: IndexSet(integer: fromIndex), toOffset:(toIndex > fromIndex ? (toIndex + 1) : toIndex))
                    }
                }
            }
        }
    }
}
