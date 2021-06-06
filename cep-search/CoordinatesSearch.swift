//
//  CoordinatesSearch.swift
//
//  Created by Filipe Souza on 04/06/21.
//

import Foundation

public class Nominatim {

    public class func getLocation(fromAddress address: String, completion: @escaping (_ result: Location?) -> Void)  {
        let queryURL =  URL(string:"https://nominatim.openstreetmap.org/search/" + address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! + "?format=json&addressdetails=1&limit=1")!
        let session = URLSession.shared
        session.dataTask(with: queryURL, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                completion(nil)
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        if let array = jsonResult as? Array<Dictionary<String, Any>> {
                            var road, postcode: String?
                            if !array.isEmpty {
                                if let address = array[0]["address"] as? Dictionary<String, String> {
                                    road = address["road"]
                                    postcode = address["postcode"]
                                }
                                completion(Location(lat: array[0]["lat"] as! String, lon: array[0]["lon"] as! String, postcode: postcode, road: road))
                            } else {
                                completion(nil)
                            }
                        }
                    }
                catch let e {
                        print(e)
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }

        }).resume()
    }
}
