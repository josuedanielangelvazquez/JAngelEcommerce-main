//
//  Result.swift
//  JangelEcommerce
//
//  Created by MacBookMBA6 on 28/12/22.
//

import Foundation

struct Result {
    var ErrorMessage : String?
    var Object : Any?
    var Objects : [Any]?
    var Ex : Error?
    var Correct : Bool
    
    init(ErrorMessage: String, Object: Any, Objects: [Any], Ex: Error, Correct: Bool) {
          self.ErrorMessage = ErrorMessage
          self.Object = Object
          self.Objects = Objects
          self.Ex = Ex
          self.Correct = Correct
      }
      init() {
          self.ErrorMessage = ""
          self.Object = nil
          self.Objects = nil
          self.Ex = nil
          self.Correct = false
      }
}



