//
//  ProductoTableViewCell.swift
//  JangelEcommerce
//
//  Created by Daniel Angel on 29/01/23.
//

import UIKit
import SwipeCellKit

class ProductoTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var imageniu: UIImageView!
    
    @IBOutlet weak var IdProductolbl: UILabel!
    @IBOutlet weak var NombreProductolbl: UILabel!
    @IBOutlet weak var PrecioUnitariolbl: UILabel!
    @IBOutlet weak var Stocklbl: UILabel!
    @IBOutlet weak var ProveedorIdlbl: UILabel!
    @IBOutlet weak var DepartamentoIdlbl: UILabel!
    @IBOutlet weak var Descripcionlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
