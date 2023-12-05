//
//  MockDetailsFetchable.swift
//  Demo
//
//  Created by suresh on 12/5/23.
//

import Foundation

public class MockDetailsFetchable: IPDetailsFetchable {
    public init() {
        
    }
    
   public  func mockModel(filename: String?)  -> IPModel? {
       if let file = filename, let urlpath =  Bundle.main.path(forResource: file, ofType: "json"), let url = URL(fileURLWithPath: urlpath) as? URL {
            do {
                let data =  try  Data(contentsOf: url, options: .mappedIfSafe)
                let model = try JSONDecoder().decode(IPModel.self, from: data)
                return model
            } catch (let error) {
                print("mock json parser failed \(error)")
            }
        }
        return nil
    }
}
