//
//  CarritoTableViewCell.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 25/01/23.
//

import UIKit
import SwipeCellKit
class CarritoTableViewCell: SwipeTableViewCell {

    
    @IBOutlet weak var ProductoImage: UIImageView!
    @IBOutlet weak var NombreProductolbl: UILabel!
    @IBOutlet weak var CantidadProductolbl: UILabel!
    @IBOutlet weak var PrecioUnitariolbl: UILabel!
    var IdProducto = 0
    var subtotalProducto = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
