//
//  File.swift
//  Demo
//
//  Created by suresh on 12/3/23.
//

import Foundation

public struct IPModel: Codable, Identifiable {

    let ip: String?
    let network: String?
    let version: String?
    let city:String?
    let region:String?
    let regionCode:String?
    let country:String?
    let countryName: String?
    let countryCode:String?
    let countryCodeIso3:String?
    let countryCapital:String?
    let countryTld:String?
    let continentCode:String?
    let inEu:Bool?
    let postal:String?
    let latitude:Double?
    let longitude:Double?
    let timezone:String?
    let utcOffset:String?
    let countryCallingCode:String?
    let currency:String?
    let currencyName:String?
    let languages:String?
    let countryArea:Double?
    let countryPopulation:Int?
    let asn:String?
    let org:String?
    public let id = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case ip
        case network
        case version
        case city
        case region
        case regionCode = "region_code"
        case country
        case countryName = "country_name"
        case countryCode = "country_code"
        case countryCodeIso3 = "country_code_iso3"
        case countryCapital = "country_capital"
        case countryTld = "country_tld"
        case continentCode = "continent_code"
        case inEu = "in_eu"
        case postal
        case latitude
        case longitude
        case timezone
        case utcOffset = "utc_offset"
        case countryCallingCode = "country_calling_code"
        case currency
        case currencyName = "currency_name"
        case languages
        case countryArea = "country_area"
        case countryPopulation = "country_population"
        case asn
        case org
    }
    
}

extension IPModel {
    func toArrayOfDict() -> [String:Any] {
           var dict = [String:Any]()
           let otherSelf = Mirror(reflecting: self)
           for child in otherSelf.children {
               if let key = child.label {
                   dict[key] = child.value
               }
           }
           return dict
       }
}
