//
//  ProductoTableViewCell.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 30/12/22.
//

import UIKit

class ProductoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var IdProductolbl: UILabel!
    @IBOutlet weak var Nombrelbl: UILabel!
    @IBOutlet weak var PrecioUnitariolbl: UILabel!
    @IBOutlet weak var Stocklbl: UILabel!
    @IBOutlet weak var IdProveedorlbl: UILabel!
    @IBOutlet weak var IdDepartamento: UILabel!
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
