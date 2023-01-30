//
//  BusquedaEspecificaViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 16/01/23.
//

import Foundation
import UIKit
class BusquedaEspecificaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
   
    let productoviewmodel = ProductoViewModel()
    var productos = [Producto]()
 //   let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
	
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var Busqedatext: UITextField!
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        self.collectionView.register(UINib(nibName: "ProductoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ProductoviewCelda")
        
    }
    func loadData(){
        let result = productoviewmodel.GETBYNOMBRE(Busqedatext.text! )
        if result.Correct{
            productos = result.Objects! as! [Producto]
            collectionView.reloadData()
        }
        else{
            print("Error al obtener los datos ")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductoviewCelda", for: indexPath as IndexPath) as!  ProductoCollectionViewCell
      
              cell.Nombrelbl.text = String(self.productos[0].Nombre!)
             cell.PrecioUnitariolbl.text = String(productos[indexPath.row].PrecioUnitario!)
             
              cell.Descripcionlbl.text = String(productos[indexPath.row].Descripcion!)
              if productos[indexPath.row].Imagen == ""{
                  cell.Imageui.image = UIImage(named: "Image")
              }
              else{
                  let imagendata = Data(base64Encoded: productos[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                  cell.Imageui.image = UIImage(data: imagendata!)
              }
        return cell
    }
    
    
    @IBAction func BuscarAction(_ sender: Any) {
        
        loadData()
        
    }
   
    
    
    
}

