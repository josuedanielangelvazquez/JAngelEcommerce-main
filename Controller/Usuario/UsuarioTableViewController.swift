//
//  UsuarioTableViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 09/01/23.
//

import UIKit
import SwipeCellKit
class UsuarioTableViewController: UITableViewController {
    let usuarioviewmodel = UsuarioViewModel()
    var IdUsuario = 0
    var usuarios = [usuario]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "usuarioTableViewCell", bundle: nil), forCellReuseIdentifier: "UsuarioCell")
        loadDta()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        loadDta()
    }
   
    
    func loadDta(){
        let result = usuarioviewmodel.GETALL()
        if result.Correct{
            usuarios = result.Objects! as! [usuario]
            tableView.reloadData()
        }
        else{
            print("Error al obtener la informacion")
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usuarios.count
    }
  

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsuarioCell", for: indexPath) as! usuarioTableViewCell
    //    cell.IdUsuarioText.text = String(usuarios[indexPath.row].IdUsuario!)
        cell.delegate = self
        cell.IdUsuarioText.text = String(usuarios[indexPath.row].IdUsuario)
        cell.NombreText.text = usuarios[indexPath.row].Nombre
        cell.ApellidoPaternoText.text = usuarios[indexPath.row].ApellidoPaterno
        cell.ApellidoMaternoText.text = usuarios[indexPath.row].ApellidoMaterno
        cell.EmailText.text = usuarios[indexPath.row].Email
        cell.Paswwordtext.text = usuarios[indexPath.row].Password
        cell.Sexotext.text = usuarios[indexPath.row].Sexo
        cell.Telefonotext.text = usuarios[indexPath.row].Telefono
        cell.Celulartext.text = usuarios[indexPath.row].Celular
        cell.Curptext.text = usuarios[indexPath.row].Curp
        
        if usuarios[indexPath.row].Imagen == ""{
            cell.UserImage.image = UIImage(named:  "person")
               }
               else{
                   let imagedata = Data(base64Encoded: usuarios[indexPath.row].Imagen!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                   cell.UserImage.image = UIImage(data: imagedata!)
               }
        // Configure the cell...

        return cell
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

}
extension UsuarioTableViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
              if orientation == .right{
                  
                  
                  let deleteAction = SwipeAction(style: .destructive, title: "Delete") {
                      action, indexPath in
                      
                      self.IdUsuario = self.usuarios[indexPath.row].IdUsuario
                     
                      
                      let result = self.usuarioviewmodel.DELETE(var: indexPath.row)
                      if result.Correct{
                          self.loadDta()
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
                      
                      self.IdUsuario = indexPath.row
                      self.performSegue(withIdentifier: "UpdateSegues", sender: nil)
                      
                    
                  }
                  UpdateAction.image = UIImage(named: "Update")
                  UpdateAction.backgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
                  return [UpdateAction]
              }
                  }
          
      override func prepare(for segue: UIStoryboardSegue, sender: Any?){
              if segue.identifier == "UpdateSegues"{
                  let usuarioform = segue.destination as! UsuarioFormController
                  usuarioform.IdUsuarioform = self.IdUsuario
                  let tipocrud = segue.destination as! UsuarioFormController
                  tipocrud.tipocrud = "update"
                  
              }
          else{
              let tipocrud = segue.destination as! UsuarioFormController
              tipocrud.tipocrud = "add"
              
          }
              }
    
  
}
