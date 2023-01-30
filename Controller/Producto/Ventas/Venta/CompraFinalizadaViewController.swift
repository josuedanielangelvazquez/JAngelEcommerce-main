//
//  CompraFinalizadaViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 27/01/23.
//

import UIKit

class CompraFinalizadaViewController: UIViewController {
    var precio = 0.0
    
    
    @IBOutlet weak var Total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        Total.text = String(precio)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SeguirComprandosegues(_ sender: UIButton) {
        performSegue(withIdentifier: "Areasegues", sender: nil)
        self.dismiss(animated: true)
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
