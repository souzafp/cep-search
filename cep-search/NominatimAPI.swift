//
//  NominatimAPI.swift
//
//  Created by Filipe Souza on 03/06/21.
//

import Foundation

public class Location {
    
    public var latitude: String
    public var longitude: String
    public var countryCode: String?
    public var postcode: String?
    public var road: String?
    
    required public init(lat: String, lon: String, postcode: String?, road: String?) {
        self.latitude = lat
        self.longitude = lon
        self.postcode = postcode
        self.road = road
    }
}
