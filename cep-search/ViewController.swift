//
//  ViewController.swift
//  cep-search
//
//  Created by Filipe Souza on 02/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfCep: UITextField!
    @IBOutlet weak var lblResultEnd: UILabel!
    @IBOutlet weak var lblResultBairro: UILabel!
    @IBOutlet weak var lblResultCidade: UILabel!
    @IBOutlet weak var lblResultEstado: UILabel!
    @IBOutlet weak var lblResultDDD: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnSearch(_ sender: Any) {
        CEPSearch.search(tfCep.text!){ (cep) in
            DispatchQueue.main.sync {
                self.lblResultEnd.text = "\(cep.logradouro)"
                self.lblResultBairro.text = "\(cep.bairro)"
                self.lblResultCidade.text = "\(cep.localidade)"
                self.lblResultEstado.text = "\(cep.uf)"
                self.lblResultDDD.text = "\(cep.ddd)"
            }
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

