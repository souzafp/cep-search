//
//  ViewController.swift
//  cep-search
//
//  Created by Filipe Souza on 02/06/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tfCep: UITextField!
    @IBOutlet weak var lblResultEnd: UILabel!
    @IBOutlet weak var lblResultBairro: UILabel!
    @IBOutlet weak var lblResultCidade: UILabel!
    @IBOutlet weak var lblResultEstado: UILabel!
    @IBOutlet weak var lblResultDDD: UILabel!
    @IBOutlet weak var mapDisplay: MKMapView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnClean: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCep.delegate = self
        btnSearch.layer.cornerRadius = 10
        btnSearch.clipsToBounds = true
        btnClean.layer.cornerRadius = 10
        btnClean.clipsToBounds = true
        tfCep.keyboardType = .numberPad
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfCep{
            let maxLength = 8
            let currentString: NSString = (tfCep.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        return true
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        CEPSearch.search(tfCep.text!){ (cep) in DispatchQueue.main.sync {
            self.lblResultEnd.text = "\(cep.logradouro)"
            self.lblResultBairro.text = "\(cep.bairro)"
            self.lblResultCidade.text = "\(cep.localidade)"
            self.lblResultEstado.text = "\(cep.uf)"
            self.lblResultDDD.text = "\(cep.ddd)"
        }
        let endereco = "\(cep.logradouro) \(cep.bairro)"
        Nominatim.getLocation(fromAddress: endereco, completion:{ (Location) -> Void in
            let lat = Double(Location!.latitude)
            let long = Double(Location!.longitude)
            
            if Location.self != nil{
                let annontation = MKPointAnnotation()
                do{
                annontation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
                }
                self.mapDisplay.addAnnotation(annontation)
                let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                self.mapDisplay.setRegion(region, animated: true)
            }
        })
        }
    }
    
    @IBAction func btnClean(_ sender: Any) {
        self.tfCep.text = ""
        self.lblResultEnd.text = ""
        self.lblResultBairro.text = ""
        self.lblResultCidade.text = ""
        self.lblResultEstado.text = ""
        self.lblResultDDD.text = ""
    }
}
