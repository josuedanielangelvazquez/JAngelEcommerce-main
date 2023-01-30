//
//  GetAllTableViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 30/12/22.
//

import UIKit
import SwipeCellKit

class GetAllTableViewController: UITableViewController {
let productoviewmodel = ProductoViewModel()
    var idproducto = 0
    var productos = [Producto]()
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.estimatedRowHeight = 400
        //tableView.rowHeight = UITableView.automaticDimension
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductoCell")
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
      loaddData()
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    override func viewDidDisappear(_ animated: Bool) {
    }
    func loaddData(){
        let result = productoviewmodel.GetAll()
        if result.Correct{
            productos = result.Objects! as! [Producto]
            tableView.reloadData()
        }
        else{
            print("Alert")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  productos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductoCell", for: indexPath) as! ProductoTableViewCell
        cell.delegate = self
        cell.IdProductolbl.text = String(productos[indexPath.row].IdProducto!)
        cell.NombreProductolbl.text = productos[indexPath.row].Nombre
        cell.PrecioUnitariolbl.text = String(productos[indexPath.row].PrecioUnitario!)
        cell.Stocklbl.text = String(productos[indexPath.row].Stock!)
        cell.ProveedorIdlbl.text = String(productos[indexPath.row].ProveedorId!)
        cell.DepartamentoIdlbl.text = String(productos[indexPath.row].DepartamentoId!)
        cell.Descripcionlbl.text = productos[indexPath.row].Descripcion
        if productos[indexPath.row].Imagen == ""{
            cell.imageniu.image = UIImage(named:  "Image")
        }
        else{
            let imagedata = Data(base64Encoded: productos[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            cell.imageniu.image = UIImage(data: imagedata!)
        }

        // Configure the cell...

        return cell
    }
    
    
    
    
      }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension GetAllTableViewController: SwipeTableViewCellDelegate{
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
     
        
        if orientation == .right{
            
            
            let deleteAction = SwipeAction(style: .destructive, title: "Delete") {
                action, indexPath in
                
                self.idproducto = self.productos[indexPath.row].IdProducto!
                print("La celda es el indice: \(indexPath.row) y el IdProducto es: \(self.idproducto)")
                
                let result = self.productoviewmodel.Delete(var: self.idproducto)
                if result.Correct{
                    self.loaddData()
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
        else{
            
            let  UpdateAction = SwipeAction(style: .destructive , title: "Update"){
                action, indexPath in
                
                self.idproducto = self.productos[indexPath.row].IdProducto!
                self.performSegue(withIdentifier: "UpdateSegues", sender: nil)
                
              
            }
            UpdateAction.image = UIImage(named: "Update")
            UpdateAction.backgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
            return [UpdateAction]
        }
            }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "UpdateSegues"{
            let productoform = segue.destination as! ViewController
            productoform.idproductoform = self.idproducto
            
        }
    else{}
    
    }
    
}

