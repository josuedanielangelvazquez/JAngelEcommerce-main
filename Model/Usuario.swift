//
//  Usuario.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 06/01/23.
//

import Foundation
import CoreData
struct usuario{
var IdUsuario:  Int
    var UserName: String
    var Nombre: String
    var ApellidoPaterno: String
    var ApellidoMaterno: String
    var Email: String
    var Password: String
    var FechaNacimiento: Date
    var Sexo: String
    var Telefono: String
    var Celular: String
    var Curp: String
    var Imagen: String?
    
    init(IdUsuario: Int , UserName: String, Nombre: String, ApellidoPaterno: String, ApellidoMaterno: String, Email: String, Password: String, FechaNacimiento: Date, Sexo: String, Telefono: String, Celular: String, Curp: String, Imagen: String) {
        self.IdUsuario = IdUsuario
        self.UserName = UserName
        self.Nombre = Nombre
        self.ApellidoPaterno = ApellidoPaterno
        self.ApellidoMaterno = ApellidoMaterno
        self.Email = Email
        self.Password = Password
        self.FechaNacimiento = FechaNacimiento
        self.Sexo = Sexo
        self.Telefono = Telefono
        self.Celular = Celular
        self.Curp = Curp
        self.Imagen = Imagen
        
    }
    init() {
        self.IdUsuario = 0
        self.UserName = ""
        self.Nombre = ""
        self.ApellidoPaterno = ""
        self.ApellidoMaterno = ""
        self.Email = ""
        self.Password = ""
        self.FechaNacimiento = Date()
        self.Sexo = ""
        self.Telefono = ""
        self.Celular = ""
        self.Curp = ""
        self.Imagen = ""
    }
}
