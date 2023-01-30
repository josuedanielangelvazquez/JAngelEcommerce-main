//
//  ViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 27/12/22.
//

import UIKit
import iOSDropDown
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var IdProveedor: DropDown!
    
    @IBOutlet weak var addbutton: UIButton!
    
    @IBOutlet weak var updatebutton: UIButton!
    
    @IBOutlet weak var UIimage: UIImageView!
    
    @IBOutlet weak var StockText: UITextField!
    @IBOutlet weak var ProductoText: UITextField!
    @IBOutlet weak var PrecioUnitarioText: UITextField!
    @IBOutlet weak var DescripcionText: UITextField!
    @IBOutlet weak var IdProductoText: UITextField!
    @IBOutlet weak var IdDepartamento: DropDown!
    @IBOutlet weak var IdArea: DropDown!
    var idproveedor = 0
    var iddepartamento = 0
    var idproductoform = 0
    let productoViewModel = ProductoViewModel()
    var productoModel : Producto? = nil
    var proveedorviewmodel = ProveedorViewModel()
    var Areaviewmodel = AreaViewModel()
    var departamentovieewmodel = DepartamentoViewModel()
    let imagepicker = UIImagePickerController()
    var areas = Departamento(Nombre: "", AreaId: 0)
    var productos = Producto()
    override func viewDidLoad() {
        IdProveedor.optionArray = []
        IdProveedor.optionIds = []
        IdDepartamento.optionArray = [String]()
        IdDepartamento.optionIds = [Int]()
        IdArea.optionArray = [String]()
        IdArea.optionIds = [Int]()
       loadData()
        IdArea.didSelect{ selectedText, index, id in self.LoadDEepartamentos(id)}
       super.viewDidLoad()
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        imagepicker.isEditing = false
        IdProductoText.isHidden = true
        validar()
    }
    func loadData(){
        let result  = proveedorviewmodel.GetAll()
        for proveedor in result.Objects as! [Proveedor]{
            IdProveedor.optionArray.append(proveedor.Nombre)
            IdProveedor.optionIds?.append(proveedor.IdProveedor)
        }
        
        let result2 = Areaviewmodel.GetAll()
        for Area in result2.Objects as! [Area]{
            IdArea.optionArray.append(Area.Nombre)
            IdArea.optionIds?.append(Area.IdArea)
        }
        IdProveedor.didSelect{(selectedText , index ,id) in
            self.IdProveedor.text! =  String(id)
            self.idproveedor = id
            
            
        }
    }
    func LoadDEepartamentos(_ IdArea : Int){
        let result = departamentovieewmodel.GETBYIDAREA(IdArea)
        if result.Correct{
            IdDepartamento.optionArray = [String]()
            IdDepartamento.optionIds = [Int]()
            IdDepartamento.text = ""
            for departamento in result.Objects as! [Departamento]{
                IdDepartamento.optionArray.append(departamento.Nombre)
                IdDepartamento.optionIds?.append(departamento.IdDepartamento!)
            }
            IdDepartamento.didSelect{(selectedText , index ,id) in
                self.IdDepartamento.text = String(id)
                self.iddepartamento = id
               
            }
        }
    
    }
    func validar(){
        if idproductoform == 0{
            updatebutton.isHidden = true
            UIimage.image = UIImage(named:  "Image")
        }
            else{
                addbutton.isHidden = true
              let result = productoViewModel.GetById(var: idproductoform)
                IdProveedor.optionIds = []
                IdProveedor.optionArray = []
                let result2 = proveedorviewmodel.GetAll()
                var index = 0
                for proveedor in result2.Objects as! [Proveedor]{
                    IdProveedor.optionArray.append(proveedor.Nombre)
                    IdProveedor.optionIds?.append(proveedor.IdProveedor)
                }

                productos = result.Object! as! Producto
                for idproveedor in 0..<IdProveedor.optionIds!.count {
                    if (IdProveedor.optionIds![idproveedor] == productos.ProveedorId){
                        index = idproveedor
                    }
                    else{print("error con el dropview")}
                }
            
               
                IdDepartamento.optionArray = []
                IdDepartamento.optionIds = []
                var IdDepartamentoArea = [0]
                let resultDepartamento = departamentovieewmodel.GetAll()
                var indexDepartamento = 0
                for departamento in resultDepartamento.Objects as! [Departamento]{
                    IdDepartamento.optionArray.append(departamento.Nombre)
                    IdDepartamento.optionIds?.append(departamento.IdDepartamento!)
                    IdDepartamentoArea.append(departamento.AreaId)
                
                }

                productos = result.Object! as! Producto
                for iddepartamento in 0..<IdDepartamento.optionIds!.count {
                    if (IdDepartamento.optionIds![iddepartamento] == productos.DepartamentoId){
                        indexDepartamento = iddepartamento
                    }
                    else{print("error con el dropview")}
                }
                IdArea.optionArray = []
                IdArea.optionIds = []
                let resultArea = Areaviewmodel.GetAll()
                var indexArea = 0
                for departamento in resultArea.Objects as! [Area]{
                    IdArea.optionArray.append(departamento.Nombre)
                    IdArea.optionIds?.append(departamento.IdArea)
                }

                for IndexArea in 0..<IdArea.optionIds!.count{
                    if (IdArea.optionIds![IndexArea] == IdDepartamentoArea[indexDepartamento]){
                        indexArea = IndexArea
                        print(indexArea)
                    }
                    else{print("este no es el id")}
                }
                
                
                productos = result.Object! as! Producto
                var IdProducto = productos.IdProducto!
                var PrecioUnitario = productos.PrecioUnitario!
                var Stock = productos.Stock!
                var Iddepartamento = IdDepartamento.optionArray[indexDepartamento]
                var IdProveedor = IdProveedor.optionArray[index]
                var Descripciont = productos.Descripcion!
                var idarea = IdArea.optionArray[indexArea]
                
                IdProductoText.text = String(IdProducto)
                ProductoText.text = productos.Nombre
                PrecioUnitarioText.text = String(PrecioUnitario)
                StockText.text = String(Stock)
                self.IdProveedor.text = String(IdProveedor)
                IdArea.text = String(idarea)
               IdDepartamento.text = String(Iddepartamento)
                DescripcionText.text = Descripciont
                if productos.Imagen == ""{
                    UIimage.image = UIImage(named:  "Image")
                }
                else{
                    let imagedata = Data(base64Encoded: productos.Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                    UIimage.image = UIImage(data: imagedata!)
                }
                                
            }

        }
  
       
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        UIimage.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func PhotoAction(_ sender: Any) {
   
        self.present(imagepicker, animated: true)
              
        
    }
    @IBAction func ButtonAction(_ sender: UIButton) {
        let producto = ProductoText.text!
        let PrecioUnitario = Double(PrecioUnitarioText.text!)!
        let Stock = Int(StockText.text!)!
        let IdProveedor = idproveedor
        let IdDepartamento = iddepartamento
        let Descripcion = DescripcionText.text!
        let image = UIimage.image!
        let imagenstring : String
        if UIimage.restorationIdentifier == "Image"{
            imagenstring = ""
        }else{
            let imagedata = image.pngData()! as NSData
            imagenstring = imagedata.base64EncodedString(options: .lineLength64Characters)
        }
        
        
        productoModel = Producto(IdProducto: 0, Nombre: producto, PrecioUnitario: PrecioUnitario, Stock: Stock, ProveedorId: IdProveedor, DepartamentoId: IdDepartamento, Descripcion: Descripcion, Imagen: imagenstring)
       
        let result = productoViewModel.Add(Producto: productoModel!)
    }
    @IBAction func ActualizarAction(_ sender: UIButton) {
        let IdProducto = Int(IdProductoText.text!)!
        let producto = ProductoText.text!
        let PrecioUnitario = Double(PrecioUnitarioText.text!)!
        let Stock = Int(StockText.text!)!
       let IdProveedor = idproveedor
        let IdDepartamento = iddepartamento
        print(iddepartamento)
        let Descripcion = DescripcionText.text!
        print(idproveedor)
        let image = UIimage.image!
        let imagenstring : String
        if UIimage.restorationIdentifier == "Image"{
            imagenstring = ""
        }else{
            let imagedata = image.pngData()! as NSData
            imagenstring = imagedata.base64EncodedString(options: .lineLength64Characters)
        }
        
        
        productoModel = Producto(IdProducto: IdProducto, Nombre: producto, PrecioUnitario: PrecioUnitario, Stock: Stock, ProveedorId: IdProveedor, DepartamentoId: IdDepartamento, Descripcion: Descripcion, Imagen: imagenstring)
       
        let result = productoViewModel.Update(Producto: productoModel!)
    }
 
}



