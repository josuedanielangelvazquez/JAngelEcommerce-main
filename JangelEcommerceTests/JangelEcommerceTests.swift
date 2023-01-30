//
//  JangelEcommerceTests.swift
//  JangelEcommerceTests
//
//  Created by MacBookMBA6 on 17/01/23.
//

import XCTest
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
@testable import JangelEcommerce

final class JangelEcommerceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testAddTrue() {
        let departamento = DepartamentoViewModel()
        let departamentomodel : Departamento
        departamentomodel = Departamento(Nombre: "Test", AreaId: 1)
        
        let result = departamento.Add(Departamento: departamentomodel)
        
        XCTAssertTrue(result.Correct, "Error")
    }
    
    func testAddFalse() {
        let departamento = DepartamentoViewModel()
        let departamentomodel : Departamento
        departamentomodel = Departamento(Nombre: "Test", AreaId: 1)
        
        let result = departamento.Add(Departamento: departamentomodel)
        
        XCTAssertFalse(result.Correct, "Error")
    }
    
    func testGetAll() {
        var departamentoviewmodel = DepartamentoViewModel()
        let result = departamentoviewmodel.GetAll()
        var departamentos = [Departamento]()
        departamentos = result.Objects! as! [Departamento]
        XCTAssertTrue(result.Correct, "Error")
    }
    func testGetAllFail() {
        var departamentoviewmodel = DepartamentoViewModel()
        let result = departamentoviewmodel.GetAll()
        var departamentos = [Departamento]()
        departamentos = result.Objects! as! [Departamento]
        XCTAssertFalse(result.Correct, "Error")
    }
    
    
    func testGetById() {
        var departamentoviewmodel = DepartamentoViewModel()
        var departamentos : Departamento
        let result = departamentoviewmodel.GetById(var: 1)
          departamentos = result.Object as! Departamento
        XCTAssertTrue(result.Correct, "Error")

        
    }
    func testGetByIdFail() {
        var departamentoviewmodel = DepartamentoViewModel()
        var departamentos : Departamento
        let result = departamentoviewmodel.GetById(var: 4)
          departamentos = result.Object as! Departamento
        XCTAssertFalse(result.Correct, "Error")

    }
    
    func testUpdateFail() {
            var departamentoviewmodel = DepartamentoViewModel()
            let departamentomodel : Departamento
            departamentomodel = Departamento(IdDepartamento: 2, Nombre: "Test", AreaId: 2)
                  
                   let result = departamentoviewmodel.Update(Departamento:  departamentomodel)
            
            XCTAssertFalse(result.Correct, "Error")
   
    }
    func testUpdate() {
        var departamentoviewmodel = DepartamentoViewModel()
        let departamentomodel : Departamento
        departamentomodel = Departamento(IdDepartamento: 2, Nombre: "Test", AreaId: 2)
              
               let result = departamentoviewmodel.Update(Departamento:  departamentomodel)
        
        XCTAssertTrue(result.Correct, "Error")
   
   
        
    }
    func testDelete() {
        var departamentoviewmodel = DepartamentoViewModel()
        let result = departamentoviewmodel.Delete(var: 3)
        XCTAssertTrue(result.Correct, "Error")
        
    }
    func testDeletefail() {
        var departamentoviewmodel = DepartamentoViewModel()
        let result = departamentoviewmodel.Delete(var: 3)
        XCTAssertFalse(result.Correct, "Error")
        
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
