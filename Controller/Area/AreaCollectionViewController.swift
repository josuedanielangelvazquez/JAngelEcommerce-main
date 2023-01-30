//
//  DepartamentoCollectionViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 12/01/23.
//

import UIKit


class AreaCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let areaviewmodel = AreaViewModel()
    var idarea = 0
    var areas = [Area]()

    override func viewDidLoad() {
         super.viewDidLoad()
        
      self.navigationItem.setHidesBackButton(true, animated: false)


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "DepartamentoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "departamentoviewcelda")
loadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       }
       func loadData(){
           let result = areaviewmodel.GetAll()
           if result.Correct{
               areas = result.Objects! as! [Area]
               collectionView.reloadData()
           }
           else{
               print("Error al obtener los datos")
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
        return areas.count
    }

   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "departamentoviewcelda", for: indexPath) as! DepartamentoCollectionViewCell
        
        cell.Nombrelbl.text = String(areas[indexPath.row].Nombre)
        cell.DepartamentoImage.image = UIImage(named: areas[indexPath.row].Nombre)
        //idarea = areas[indexPath.row].IdArea
        return cell
       
    }
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
   // didselectRowAt
    {
      /*  let cell = collectionView.cellForItem(at: indexPath) as! AreaCollectionViewCell*/
        self.idarea = areas[indexPath.row].IdArea
        print(areas[indexPath.row].Nombre)
        print(self.idarea)
        self.performSegue(withIdentifier: "SeguesDepartamento", sender: nil)
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let Departamento = segue.destination as! DepartamentoCollectionViewController
        Departamento.IdAreaProducto = self.idarea
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
