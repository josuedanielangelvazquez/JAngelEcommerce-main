//
//  VentaViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 26/01/23.
//

import UIKit

class VentaViewController: UIViewController {
    var ventaviewmodel = VentaViewModel()
    var carritoviewmodel = CarritoViewModel()
    var ventaModel : Venta? = nil
    var Total = 0.0
    @IBOutlet weak var TotalApagarlbl: UILabel!
    
    @IBOutlet weak var MetodoPagotext: UITextField!
    
    @IBOutlet weak var Fechadate: UIDatePicker!
    
    override func viewDidLoad() {

        TotalApagarlbl.text = String(Total)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func Pagar(_ sender: Any) {
         ventaModel = Venta(IdVenta: 0, IdUsuario: 1, Total: Total, IdMetodoPago: 1, Fecha: Fechadate.date)
         let result = ventaviewmodel.Add(venta: ventaModel!)
         if result.Correct == true{
       
             carritoviewmodel.DeleteFROM()
             navigationController
             performSegue(withIdentifier: "seguesfinalizarCompra", sender: nil)

         }
        
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguesfinalizarCompra"{
            let Finalizar = segue.destination as! CompraFinalizadaViewController
            Finalizar.precio = Total
        }
    }

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    }
    


