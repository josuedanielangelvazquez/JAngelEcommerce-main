//
//  ViewController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 27/12/22.
//

import UIKit
import CoreData
class UsuarioFormController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate{
    
    
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var UpdateButton: UIButton!

    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var IdUsuariotext: UITextField!
    @IBOutlet weak var UserNametext: UITextField!
    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var ApellidoPaternotext: UITextField!
    @IBOutlet weak var ApellidoMaternotext: UITextField!
    @IBOutlet weak var Emailtext: UITextField!
    @IBOutlet weak var Passwordtext: UITextField!
    @IBOutlet weak var Sexotext: UITextField!
    @IBOutlet weak var Telefonotext: UITextField!
    @IBOutlet weak var Celulartext: UITextField!
    @IBOutlet weak var Curptext: UITextField!
    
    
    
    @IBOutlet weak var FechaNacimientodate: UIDatePicker!
    @IBOutlet weak var FechaNacimientoview: UITextField!
    var tipocrud = ""
    var IdUsuarioform = 0
    let dateFormatter = DateFormatter()
    let usuarioviewmodel = UsuarioViewModel()
    var Usuario = usuario()
    let imagepicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
            imagepicker.delegate = self
              imagepicker.sourceType = .photoLibrary
              imagepicker.isEditing = false
             
        // Do any additional setup after loading the view.
        dateFormatter.dateFormat = "MM/dd/yyyy"
        FechaNacimientoview.inputView = FechaNacimientodate
        FechaNacimientodate.datePickerMode = .date
        FechaNacimientoview.text = dateFormatter.string(from: FechaNacimientodate.date)
        
        validar()
    }
    func validar(){
        if tipocrud.elementsEqual("add") {
            UpdateButton.isHidden = true
            UserImage.image = UIImage(named: "person")
            

            
        }
        else{
            AddButton.isHidden = true
            let result = usuarioviewmodel.GETBYID(var: IdUsuarioform)
            Usuario = result.Object! as! usuario
            Nombre.text = Usuario.Nombre
            UserNametext.text = Usuario.UserName
            ApellidoPaternotext.text = Usuario.ApellidoPaterno
            ApellidoMaternotext.text = Usuario.ApellidoMaterno
            Emailtext.text = Usuario.Email
            Passwordtext.text = Usuario.Password
            Sexotext.text = Usuario.Sexo
            Telefonotext.text = Usuario.Telefono
            Celulartext.text = Usuario.Celular
            Curptext.text = Usuario.Curp
            if Usuario.Imagen == ""{
                UserImage.image = UIImage(named:  "person")
                         }
                         else{
                             let imagedata = Data(base64Encoded: Usuario.Imagen!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                             UserImage.image = UIImage(data: imagedata!)
                         }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        UserImage.image = info[.originalImage] as? UIImage
            
            dismiss(animated: true, completion: nil)
    }
    
    @IBAction func FechaNacimientoActtion(_ sender: UIDatePicker) {
        
        FechaNacimientoview.text = dateFormatter.string(from: sender.date)
        view.endEditing(true)
    }
    
    
    
    @IBAction func Add(_ sender: UIButton) {

        Usuario.Nombre = Nombre.text!
        Usuario.UserName = UserNametext.text!
        Usuario.ApellidoPaterno = ApellidoPaternotext.text!
        Usuario.ApellidoMaterno = ApellidoMaternotext.text!
        Usuario.Email = Emailtext.text!
        Usuario.Password = Passwordtext.text!
        Usuario.FechaNacimiento = FechaNacimientodate.date
        Usuario.Sexo = Sexotext.text!
        Usuario.Telefono = Telefonotext.text!
        Usuario.Celular = Celulartext.text!
        Usuario.Curp = Curptext.text!
        let image = UserImage.image!
        let imagenstring : String
        
        if UserImage.restorationIdentifier == "person"{
            imagenstring = ""
        }else{
            let imagedata = image.pngData()! as NSData
            imagenstring = imagedata.base64EncodedString(options: .lineLength64Characters)
        }
        Usuario.Imagen = imagenstring
        
        let result = usuarioviewmodel.Add(usuario: Usuario)
        
        if result.Correct {
            
        }
     //   let result = usuarioviewmodel.GETALL()
    }
    
    @IBAction func UpdateButton(_ sender: UIButton) {
        
        Usuario.Nombre = Nombre.text!
        Usuario.UserName = UserNametext.text!
        Usuario.ApellidoPaterno = ApellidoPaternotext.text!
        Usuario.ApellidoMaterno = ApellidoMaternotext.text!
        Usuario.Email = Emailtext.text!
        Usuario.Password = Passwordtext.text!
        Usuario.FechaNacimiento = FechaNacimientodate.date
        Usuario.Sexo = Sexotext.text!
        Usuario.Telefono = Telefonotext.text!
        Usuario.Celular = Celulartext.text!
        Usuario.Curp = Curptext.text!
        let image = UserImage.image!
        let imagenstring : String
        if UserImage.restorationIdentifier == "person"{
                   imagenstring = ""
               }else{
                   let imagedata = image.pngData()! as NSData
                   imagenstring = imagedata.base64EncodedString(options: .lineLength64Characters)
               }
        Usuario.Imagen = imagenstring
               
        
        let result = usuarioviewmodel.UPDATE(var: IdUsuarioform, var: Usuario)
        
        
        if result.Correct{
            let correct = UIAlertController(title: "Ok", message: "Se Acualizo", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "Ok", style: .default)
            correct.addAction(Ok)
            self.present(correct, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Alerta", message: "Ocurrio un Error", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(Ok)
            self.present(alert, animated: true)
      
            
        }
        
    }
    
    
    @IBAction func imagebutton(_ sender: UIButton) {
        self.present(imagepicker, animated: true)

    }
}
