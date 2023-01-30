//
//  DetailViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 23/01/23.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var informacion = ["","",0] as [Any]
    var cantidadDetail = 1
    var Nombre = ""
    var Descripcion = ""
    var Precio = 0.0
    var IdProducto = 0
    let productoviewmodel = ProductoViewModel()
    var producto = Producto()
    let carritoviewmodel = CarritoViewModel()
    var carritomodel : Carrito? = nil
    
    @IBOutlet weak var CantidadSetepper: UIStepper!
    @IBOutlet weak var imageProducto: UIImageView!
    
    @IBOutlet weak var DetailsTable: UITableView!

    @IBOutlet weak var Cantidadlbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     let stepper = CantidadSetepper
        stepper?.minimumValue = 1
        stepper?.maximumValue = 15
        stepper?.value = 1
              DetailsTable.delegate = self
                   DetailsTable.dataSource = self
                   view.addSubview(DetailsTable)
        self.DetailsTable.register(UINib(nibName: "DetailProductoTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailProductoCell")
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let result = productoviewmodel.GetById(var: IdProducto)
        
        if result.Correct == true{
            producto = result.Object! as! Producto
            Nombre = producto.Nombre!
            Descripcion = producto.Descripcion!
            Precio = producto.PrecioUnitario!
            informacion =  [ String(Precio), Nombre, Descripcion]
            if producto.Imagen == ""{
                imageProducto.image = UIImage(named: "Image")
            }
            else{
                let imagedata = Data(base64Encoded: producto.Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                imageProducto.image = UIImage(data: imagedata!)
            }
            DetailsTable.reloadData()
            
        }
        else{
            print("Error al obtener la informaicon del viewmodel")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
      }
      
 
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
          return  informacion.count
      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProductoCell", for: indexPath) as! DetailProductoTableViewCell
        var datoestraido = informacion[indexPath.row]
        cell.Informacionlbl.text = datoestraido as! String
        return cell
       
        }
    
    

    @IBAction func ComprarAction(_ sender: UIButton) {
        
        carritomodel = Carrito(IdVentaProducto: 0, Cantidad: cantidadDetail, IdProducto: IdProducto, Nombre: "", PrecioUnitario: 0, Imagen: "")
        let result = carritoviewmodel.Add(Producto: carritomodel!
        )
        if result.Correct == true{
            let alert = UIAlertController(title: "Correcto", message: "\(Nombre) se agrego a tu carrito", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(Ok)
            self.present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Ocurrio un Error", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(Ok)
            self.present(alert, animated: true)
      
            
        }
    }
    
    
    @IBAction func Cantidadstepper(_ sender: UIStepper) {
        
        cantidadDetail = Int(sender.value)
        Cantidadlbl.text = String(cantidadDetail)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
