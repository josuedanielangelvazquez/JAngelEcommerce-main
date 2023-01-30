//
//  ProductoCollectionViewCell.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 12/01/23.
//

import UIKit

class ProductoCollectionViewCell: UICollectionViewCell {
   //let productocontroller = ProductoCollectionViewController()
   
    @IBOutlet weak var Imageui: UIImageView!
    
    @IBOutlet weak var IdProductolbl: UILabel!
    @IBOutlet weak var Nombrelbl: UILabel!
    @IBOutlet weak var PrecioUnitariolbl: UILabel!
    @IBOutlet weak var Stocklbl: UILabel!
    @IBOutlet weak var IdProeedorlbl: UILabel!
    @IBOutlet weak var IdDepartamentolbl: UILabel!
    
    @IBOutlet weak var AddCarrito: UIButton!
    
    @IBOutlet weak var Descripcionlbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
}
