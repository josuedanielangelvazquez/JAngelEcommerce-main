//
//  Producto.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 28/12/22.
//

import Foundation

struct Producto{
    var IdProducto : Int?
    var Nombre : String?
    var PrecioUnitario : Double?
    var Stock : Int?
    var ProveedorId : Int?
    
    var DepartamentoId : Int?
    var Descripcion : String?
    var Imagen : String

    init(IdProducto: Int, Nombre: String, PrecioUnitario: Double, Stock: Int, ProveedorId: Int, DepartamentoId: Int, Descripcion: String, Imagen: String) {
        self.IdProducto = IdProducto
        self.Nombre = Nombre
        self.PrecioUnitario = PrecioUnitario
        self.Stock = Stock
        self.ProveedorId = ProveedorId
        self.DepartamentoId = DepartamentoId
        self.Descripcion = Descripcion
        self.Imagen = Imagen
    }
    init() {
        self.IdProducto = 0
        self.Nombre = nil
        self.PrecioUnitario = 0
        self.Stock  = 0
        self.ProveedorId = 0
        self.DepartamentoId = 0
        self.Descripcion = ""
        self.Imagen = ""
    }
    
}


