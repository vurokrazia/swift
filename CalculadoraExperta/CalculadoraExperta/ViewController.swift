//
//  ViewController.swift
//  CalculadoraExperta
//
//  Created by Jesus Alberto  Martínez Hernández  on 16/09/17.
//  Copyright © 2017 Jesus Alberto  Martínez Hernández . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var digitacion = 0;
    var suma = false;
    var resta = false;
    var division = false;
    var multiplicacion = false;
    @IBOutlet weak var resultados: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func n1(_ sender: UIButton){
        agregarDatos(numero: 1)
    }
    @IBAction func n2(_ sender: UIButton) {
        agregarDatos(numero: 2)
    }
    @IBAction func n3(_ sender: UIButton) {
        agregarDatos(numero: 3)
    }
    @IBAction func n4(_ sender: UIButton) {
        agregarDatos(numero: 4)
    }
    @IBAction func n5(_ sender: UIButton) {
        agregarDatos(numero: 5)
    }
    @IBAction func n6(_ sender: UIButton) {
        agregarDatos(numero: 6)
    }
    @IBAction func n7(_ sender: UIButton) {
        agregarDatos(numero: 7)
    }
    @IBAction func n8(_ sender: UIButton) {
        agregarDatos(numero: 8)
    }
    @IBAction func n9(_ sender: UIButton) {
        agregarDatos(numero: 9)
    }
    @IBAction func n0(_ sender: UIButton) {
        agregarDatos(numero: 0)
    }
    
    func agregarDatos(numero n:Int) {
        if(resultados.text!.isEmpty){
            resultados.text = String(n)
        }else{
            let numeros = resultados.text
            resultados.text = numeros! + String(n)
        }
    }
    @IBAction func sum(_ sender: UIButton) {
        obtenerDigitos()
        operacion(nu: 1)
    }
    @IBAction func rest(_ sender: UIButton) {
        obtenerDigitos()
        operacion(nu: 2)
    }
    @IBAction func mult(_ sender: UIButton) {
        obtenerDigitos()
        operacion(nu: 4)
    }
    @IBAction func div(_ sender: UIButton) {
        obtenerDigitos()
        operacion(nu: 3)
    }
    
    @IBAction func resultado(_ sender: UIButton) {
        if(suma || resta || division || multiplicacion){
            operacion(nu: 0)
        }
    }
    func obtenerDigitos(){
        let myString = resultados.text
        let x: Int? = Int(myString!)
        digitacion = x!
        resultados.text = ""
    }
    
    @IBAction func C(_ sender: UIButton) {
        suma = false
        resta = false
        division = false
        multiplicacion = false
        digitacion = 0
        resultados.text = ""
    }
    func operacion(nu n:Int){
        switch n {
        case 0:
            let myString = resultados.text
            let x: Int? = Int(myString!)
            if(suma){
                print(String(x!), "+", String(digitacion))
                print(String(x! + digitacion))
                resultados.text = String(x! + digitacion)
            }else if(resta){
                print(String(digitacion), "-", String(x!))
                print(String(digitacion - x!))
                resultados.text = String(digitacion - x!)
            }else if(multiplicacion){
                print(String(x!), "*", String(digitacion))
                print(String(x! * digitacion))
                resultados.text = String(x! * digitacion)
            }else if(division){
                print(String(x!), "/", String(digitacion))
                print(String(digitacion / x!))
                resultados.text = String(digitacion / x!)
            }
            digitacion = 0
        case 1:
            print("+")
            suma = true
            resta = false
            division = false
            multiplicacion = false
        case 2:
            print("-")
            suma = false
            resta = true
            division = false
            multiplicacion = false
        case 3:
            print("/")
            suma = false
            resta = false
            division = true
            multiplicacion = false
        case 4:
            print("*")
            suma = false
            resta = false
            division = false
            multiplicacion = true
        default:
            print(String(digitacion) + " mmmm")
        }
    }

}

