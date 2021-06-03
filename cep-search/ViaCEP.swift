//
//  ViaCEP.swift
//  cep-search
//
//  Created by Filipe Souza on 03/06/21.
//

import Foundation

struct ViaCEP: Decodable{
    var logradouro: String
    var bairro: String
    var localidade: String
    var uf: String
    var ddd: String
}
