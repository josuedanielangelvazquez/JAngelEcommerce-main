//
//  DepartamentoTableViewCell.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 04/01/23.
//

import UIKit
import SwipeCellKit
class DepartamentoTableViewCell: SwipeTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var IdDepartamentolbl: UILabel!
    
    @IBOutlet weak var Nombrelbl: UILabel!
    
    @IBOutlet weak var IdArealbl: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
