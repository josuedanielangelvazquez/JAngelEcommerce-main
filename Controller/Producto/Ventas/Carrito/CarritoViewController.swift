//
//  CarritoViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 24/01/23.
//

import UIKit
import SwipeCellKit
class CarritoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var productostableview: UITableView!
    @IBOutlet weak var TotalPagarlbl: UILabel!
    let carritoviewmodel = CarritoViewModel()
    var carrito = [Carrito]()
    var idCarrito =  0
    var total = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        productostableview.delegate = self
        productostableview.dataSource = self
        view.addSubview(productostableview)
        productostableview.register(UINib(nibName: "CarritoTableViewCell", bundle: nil), forCellReuseIdentifier: "carritocell")
        loadData()
     
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func loadData(){
        
        let result = carritoviewmodel.GETALL()
        if result.Correct{
            carrito = result.Objects! as![Carrito]
            productostableview.reloadData()
        }
        else{
            print("No se lograron obtener los datos")
        }
      
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "carritocell", for: indexPath) as! CarritoTableViewCell
        cell.delegate = self
        cell.IdProducto = carrito[indexPath.row].IdProducto
        cell.NombreProductolbl.text = carrito[indexPath.row].Nombre
        cell.CantidadProductolbl.text = String(carrito[indexPath.row].Cantidad)
        cell.PrecioUnitariolbl.text = String(carrito[indexPath.row].PrecioUnitario)
        cell.subtotalProducto = carrito[indexPath.row].PrecioUnitario * Double(carrito[indexPath.row].Cantidad)
        total = total + cell.subtotalProducto
        TotalPagarlbl.text = String(total)
        if carrito[indexPath.row].Imagen == ""{
            cell.ProductoImage.image = UIImage(named: "Image")
        }
        else{
            let imagendata = Data(base64Encoded: carrito[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            cell.ProductoImage.image = UIImage(data: imagendata!)
        }
        return cell
    }
    
    @IBAction func ComprarAction(_ sender: UIButton){
        if total != 0.0{
            performSegue(withIdentifier: "seguesVenta", sender: nil)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "No has agregado productos al carrito", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguesVenta"{
            let seguesVenta = segue.destination as! VentaViewController
            seguesVenta.Total = total
        }
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

extension CarritoViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]?
    {
        
        guard orientation == .right else { return nil }
      
     
        
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") {
                action, indexPath in
                
                self.idCarrito = self.carrito[indexPath.row].IdVentaProducto
                
                let result = self.carritoviewmodel.DELETE(IdCarrito: self.idCarrito)
                
                self.carrito.remove(at: indexPath.row)
                action.fulfill(with: .delete)
                
                if result.Correct{
                    self.total = 0
                    self.loadData()
                    if self.carrito.count == 0{
                        self.TotalPagarlbl.text = String(self.total)}
                    let alert = UIAlertController(title: "oK", message: "El producto se elimino correctamente", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "oK", style: .default)
                    alert.addAction(Ok)
                    self.present(alert, animated: true)
                    
                }
                else{
                    let alert = UIAlertController(title: "Alerta", message: "Ocurrio un Error", preferredStyle: .alert)
                    let Ok = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(Ok)
                    self.present(alert, animated: true)
                }
            }
            deleteAction.image = UIImage(named: "delete")
            
            return [deleteAction]
    }
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
}

