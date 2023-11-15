//
//  ImagesModel.swift
//  Filters
//
//  Created by Hassan Jillani Farooqi on 15/11/2023.
//

import Foundation


struct ImagesModel: Identifiable {
    var id: String { image }
    
    var image : String = ""
    var imageData : Data? = nil
    var filterName : String = ""
    
    public func filterType() -> FilterTypes {

        switch filterName {
        case "noise":
            return .FilterTypeNoise
        case "pixellate":
            return .FilterTypePixellate
        case "complexWave":
            return .FilterTypeWave
        case "emboss":
            return .FilterTypeEmboss
        default:
            return .FilterTypeUnknown
        }
    }
    
}
enum FilterTypes: Int {
    case FilterTypeNoise
    case FilterTypePixellate
    case FilterTypeWave
    case FilterTypeEmboss
    case FilterTypeUnknown
}
