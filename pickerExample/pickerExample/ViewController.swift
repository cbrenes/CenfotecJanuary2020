//
//  ViewController.swift
//  pickerExample
//
//  Created by Cesar Brenes on 4/11/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var carTypeTextField: UITextField!
    
    // creo los pickers necesarios en este caso necesito 2 diferentes
    let carBrandPickerView = UIPickerView()
    let carTypePickerView = UIPickerView()
    
    //creo las listas necesarias para cada picker
    var carBrandsList = ["Suzuki" ,"Chevrolet", "Ford", "Toyota", "Mitsubishi", "Hyundai"]
    var carTypesList = ["Sedan", "Hashback", "Pickup", "Suv", "MiniSuv"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
        dismissPickerView()
    }
    
    //en este metodo asigno los delegados y selecciono que cada texfield tiene un teclado de tipo picker
    func initializeTextFields() {
        carTypePickerView.delegate = self
        carBrandPickerView.delegate = self
        carBrandTextField.inputView = carBrandPickerView
        carTypeTextField.inputView = carTypePickerView
    }
    
    //Este método va a crear un boton en la parte superior derecha para que el usuario pueda cerrar el teclado
    func dismissPickerView() {
        //Es importante inicializar el tamaño del toolbar para evitar warnings de constraints en la terminal
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
        toolBar.sizeToFit()
        //El flexbutton es un espaciador que me va a permitir tener el boton done a la derecha y no a la izquierda, si lo deseara a la izquierda solo deberia eliminar este espaciador
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([flexButton,button], animated: true)
        toolBar.isUserInteractionEnabled = true
//        le asigno el toolbar a ambos textfields
        carBrandTextField.inputAccessoryView = toolBar
        carTypeTextField.inputAccessoryView = toolBar
    }
    
    //Esta es la action que se va a ejecturar cuando el usuario presione el boton done creado en el método dismissPickerView()
    //Por default al cerrarse el picker y no hacer interacción con el haciendo scroll, no tenemos forma de que los delegados se llamen por lo tanto no podemos obtener la selección, por lo tanto en este método pregunto cual es el textfield que se esta editando para asi saber que valor ponerle al mismo
    @objc func action() {
        if carBrandTextField.isEditing {
            carBrandTextField.text = carBrandsList[carBrandPickerView.selectedRow(inComponent: 0)]
        } else {
            carTypeTextField.text = carTypesList[carTypePickerView.selectedRow(inComponent: 0)]
        }
        view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //un mismo picker puede tener varios componentes, en este caso solo ocupamos uno, esto es similar a las secciones de una tabla
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //este método se encarga de saber cuantas rows tiene un picker, recibimos un pickerView como parámetro esto nos permite identificar a cual picker se refiere por eso es que hago un if con las propiedades de los picker definidas anteriormente
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == carBrandPickerView {
            return carBrandsList.count
        }
        return carTypesList.count
    }
    //Este método se encarga de hacer el pintado de la información
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == carBrandPickerView {
            return carBrandsList[row]
        }
        return carTypesList[row]
    }
    
//    Este método detecta la selección y la setea en el textfield respectivo
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == carBrandPickerView {
            carBrandTextField.text = carBrandsList[row]
        } else {
            carTypeTextField.text = carTypesList[row]
        }
    }
}


