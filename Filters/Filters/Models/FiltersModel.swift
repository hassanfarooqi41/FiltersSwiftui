//
//  FiltersModel.swift
//  Filters
//
//  Created by Hassan Jillani Farooqi on 15/11/2023.
//

import Foundation


struct FiltersModel: Codable {
    
    var image : String = ""
    var imageData : Data? = nil
    
    var filterName : String = ""
    var filterType : String = ""
}
