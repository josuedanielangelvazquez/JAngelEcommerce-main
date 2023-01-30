//
//  ProductoCollectionViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 12/01/23.
//

import UIKit

class ProductoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var ButtonCarrito: UIButton!
    var contadorProductos = 0
    let productoviemodel = ProductoViewModel()
    var IdProductoSeguesDetail = 0
    var idproductosegues = 0
    var productos = [Producto]()
    var carritoviewmodel = CarritoViewModel()
    var carritos = [Carrito]()
    var carritomodel : Carrito? = nil
    var carrito = Carrito(IdVentaProducto: 0, Cantidad: 0, IdProducto: 0, Nombre: "", PrecioUnitario: 0.0, Imagen: "")
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(ProductoCollectionViewCell.self, forCellWithReuseIdentifier: "ProductoviewCelda")
        
      self.collectionView.register(UINib(nibName: "ProductoCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ProductoviewCelda")
 
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        
               loadDataCantidadCarrito()
               loadSumaCarrito()
     

    }
    func loadDataCantidadCarrito(){
        let result = carritoviewmodel.GETALL()
        if result.Correct{
            carritos = result.Objects! as! [Carrito]
        }
        else{
            print("Error al obtener los datos")}
    }
    func loadSumaCarrito(){
        contadorProductos = 0
        for posicion in carritos{
            contadorProductos = contadorProductos + posicion.Cantidad
        }
        ButtonCarrito.setTitle(String(contadorProductos), for: .normal)

    }
    func loadData(){
        let result = productoviemodel.GETBYDEPARTAMENTO(idproductosegues)
        if result.Correct{
            productos = result.Objects! as! [Producto]
            collectionView.reloadData()
        }
        else{
            print("Error al obtener los datos")
        }
            }
   /* func PresentacionPrueba(var informacion: Bool){
        let alert = UIAlertController(title: "Ok", message: "Si funciono", preferredStyle: .alert)
        let alertNofunciono = UIAlertController(title: "Advertenia", message: "No funciono", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        alertNofunciono.addAction(ok)
        if informacion == true{
            self.present(alert, animated: true)}
        else{
            self.present(alertNofunciono, animated: true)
        }
        }*/

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
        return productos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductoviewCelda", for: indexPath as IndexPath) as!  ProductoCollectionViewCell
       // cell.backgroundColor = .red
        cell.Nombrelbl.text = String(self.productos[indexPath.row].Nombre!)
       cell.PrecioUnitariolbl.text = String(productos[indexPath.row].PrecioUnitario!)
        cell.Descripcionlbl.text = String(productos[indexPath.row].Descripcion!)
        if productos[indexPath.row].Imagen == ""{
            cell.Imageui.image = UIImage(named: "Image")
        }
        else{
            let imagendata = Data(base64Encoded: productos[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            cell.Imageui.image = UIImage(data: imagendata!)
        }
        cell.AddCarrito.addTarget(self, action: #selector(comprar), for: .touchUpInside)
        cell.AddCarrito.tag = indexPath.row
        
        
                
    
        // Configure the cell
    
        return cell
    }
    
    @objc func comprar(_ sender:UIButton){
            let producto = self.productos[sender.tag].IdProducto!
        addCompra(var: producto)
    }
    func addCompra(var idproducto: Int){
        carritomodel = Carrito(IdVentaProducto: 0, Cantidad: 1, IdProducto: idproducto, Nombre: "", PrecioUnitario: 0.0, Imagen: "")
        let result = carritoviewmodel.Add(Producto: carritomodel!)
            contadorProductos += 1
        ButtonCarrito.setTitle(String(contadorProductos), for: .normal)

        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
      {
          return CGSize(width: 100, height: 30)
      }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.IdProductoSeguesDetail = productos[indexPath.row].IdProducto!
        self.performSegue(withIdentifier: "seguesdetail", sender: nil)
    }
      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguesdetail"{
            let detail = segue.destination as! DetailViewController
            detail.IdProducto = self.IdProductoSeguesDetail}
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
