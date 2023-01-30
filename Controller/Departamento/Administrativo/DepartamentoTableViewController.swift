//
//  DepartamentoTableViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 04/01/23.
//

import UIKit
import SwipeCellKit
class DepartamentoTableViewController: UITableViewController {
    let departamentoviewmodel = DepartamentoViewModel()
        var iddepartamento = 0
    var departamentos = [Departamento]()
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(UINib(nibName: "DepartamentoTableViewCell", bundle: nil), forCellReuseIdentifier: "Departamentocell")
           
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
        let result = departamentoviewmodel.GetAll()
        if result.Correct{
            departamentos = result.Objects! as! [Departamento]
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
        return departamentos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Departamentocell", for: indexPath) as! DepartamentoTableViewCell
        cell.delegate = self
        cell.IdDepartamentolbl.text = String(departamentos[indexPath.row].IdDepartamento!)
        cell.Nombrelbl.text = String(departamentos[indexPath.row].Nombre)
        cell.IdArealbl.text = String(departamentos[indexPath.row].AreaId)

        
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
extension DepartamentoTableViewController: SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
              if orientation == .right{
                  
                  
                  let deleteAction = SwipeAction(style: .destructive, title: "Delete") {
                      action, indexPath in
                      
                      self.iddepartamento = self.departamentos[indexPath.row].IdDepartamento!
                      print("La celda es el indice: \(indexPath.row) y el IdProducto es: \(self.iddepartamento)")
                      
                      let result = self.departamentoviewmodel.Delete(var: self.iddepartamento)
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
                      
                      self.iddepartamento = self.departamentos[indexPath.row].IdDepartamento!
                      self.performSegue(withIdentifier: "UpdateSeguesDepartamento", sender: nil)
                      
                    
                  }
                  UpdateAction.image = UIImage(named: "Update")
                  UpdateAction.backgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
                  return [UpdateAction]
              }
                  }
          
      override func prepare(for segue: UIStoryboardSegue, sender: Any?){
              if segue.identifier == "UpdateSeguesDepartamento"{
                  let departamentofrom = segue.destination as! DepartamentoController
                  departamentofrom.iddepartamentoform = self.iddepartamento
                  
              }
          else{}
    }
    
    
}
