//
//  usuarioTableViewCell.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 09/01/23.
//

import UIKit
import SwipeCellKit
class usuarioTableViewCell: SwipeTableViewCell {

    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var IdUsuarioText: UILabel!
    @IBOutlet weak var NombreText: UILabel!
    @IBOutlet weak var ApellidoPaternoText: UILabel!
    @IBOutlet weak var ApellidoMaternoText: UILabel!
    @IBOutlet weak var EmailText: UILabel!
    @IBOutlet weak var Paswwordtext: UILabel!
    @IBOutlet weak var FechaNacimientotext: UILabel!
    @IBOutlet weak var Sexotext: UILabel!
    @IBOutlet weak var Telefonotext: UILabel!
    @IBOutlet weak var Celulartext: UILabel!
    @IBOutlet weak var Curptext: UILabel!
    @IBOutlet weak var UsernameText: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
