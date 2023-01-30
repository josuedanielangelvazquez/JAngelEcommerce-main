//
//  DepartamentoController.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 05/01/23.
//

import UIKit

class DepartamentoController: UIViewController, UINavigationControllerDelegate  {
    @IBOutlet weak var Addbuttonoutlet: UIButton!
    
    @IBOutlet weak var Updatebuttonoutlet: UIButton!
    
    @IBOutlet weak var IdArea: UITextField!
    @IBOutlet weak var IdDepartamentotext: UITextField!
    @IBOutlet weak var Nombretext: UITextField!
    
  
    
    var iddepartamentoform = 0
    let departamentoviewmodel = DepartamentoViewModel()
    var departamentomodel : Departamento? = nil
    let imagepicker = UIImagePickerController()
    
    var departamentos = Departamento(IdDepartamento: 0, Nombre: "", AreaId: 0)
    override func viewDidLoad() {
        IdDepartamentotext.isHidden = true
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        validar()
    }
    func validar(){
        if iddepartamentoform == 0{
            Updatebuttonoutlet.isHidden = true
   
        }
            else{
                Addbuttonoutlet.isHidden = true
              let result = departamentoviewmodel.GetById(var: iddepartamentoform)
              
                departamentos = result.Object as! Departamento
                var Iddepartamento = departamentos.IdDepartamento
                var Nombre = departamentos.Nombre
                var idarea = departamentos.AreaId
                
                IdDepartamentotext.text = String(Iddepartamento!)
                Nombretext.text = Nombre
                IdArea.text = String(idarea)
          
                }
                                
            }

    @IBAction func AddButton(_ sender: Any) {
      
               
               
        departamentomodel = Departamento(IdDepartamento: 0, Nombre: Nombretext.text!, AreaId: Int(IdArea.text!)!)
              
               let result = departamentoviewmodel.Add(Departamento: departamentomodel!)
        
    }
    
    @IBAction func Updatebutton(_ sender: Any) {
      
        departamentomodel = Departamento(IdDepartamento: Int(IdDepartamentotext.text!)!, Nombre: Nombretext.text!, AreaId: Int(IdArea.text!)!)
              
               let result = departamentoviewmodel.Update(Departamento:  departamentomodel!)
    }
    
}
    

   
