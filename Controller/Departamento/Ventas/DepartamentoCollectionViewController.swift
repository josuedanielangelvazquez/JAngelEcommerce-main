//
//  DepartamentoCollectionViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 13/01/23.
//

import UIKit


class DepartamentoCollectionViewController: UICollectionViewController {
var IdAreaProducto = 0
let departamentoviewmodel = DepartamentoViewModel()
    var departamentos = [Departamento]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(UINib(nibName: "DepartamentoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "departamentoviewcelda")

        loadData()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func loadData(){
        let result = departamentoviewmodel.GETBYIDAREA(IdAreaProducto)
        if result.Correct{
            departamentos = result.Objects! as! [Departamento]
            collectionView.reloadData()
        }
        else{
            print("error")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return departamentos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "departamentoviewcelda", for: indexPath as IndexPath) as! DepartamentoCollectionViewCell
        if departamentos[indexPath.row].Nombre.elementsEqual("Ninio"){
            cell.Nombrelbl.text = "Niño"}
        else{
            cell.Nombrelbl.text = departamentos[indexPath.row].Nombre
        }
        cell.DepartamentoImage.image = UIImage(named: departamentos[indexPath.row].Nombre)
        // Configure the cell
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let cell = collectionView.cellForItem(at: indexPath) as! DepartamentoCollectionViewCell*/
     self.IdAreaProducto = departamentos[indexPath.row].IdDepartamento!
               print(departamentos[indexPath.row].Nombre)
               print(IdAreaProducto )
        self.performSegue(withIdentifier: "segueproducto", sender: nil)
      
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Area = segue.destination as! ProductoCollectionViewController
        Area.idproductosegues = self.IdAreaProducto
    }
        
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
