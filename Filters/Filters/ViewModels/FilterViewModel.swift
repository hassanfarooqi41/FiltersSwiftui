//
//  FilterViewModel.swift
//  Filters
//
//  Created by Hassan Jillani Farooqi on 15/11/2023.
//

import SwiftUI
import Combine

class FilterViewModel: ObservableObject {
    @Published var sourceImage: UIImage?
    @Published var filteredImage: UIImage?
    @Published var selectedCategory: FilterCategory?
    
    enum FilterCategory: String, CaseIterable {
        case color
        case blur
        case distortion
        case sharpen
        case custom
    }
    
    var filters: [FilterCategory: [Filter]] = [
        .color: [ColorFilter()],
        .blur: [GaussianBlurFilter()],
        .distortion: [FishEyeFilter()],
        .sharpen: [SharpenFilter()],
        .custom: [CustomFilter()]
    ]
    
    func applyFilter(filter: Filter) {
        filteredImage = filter.apply(to: sourceImage)
    }
}

protocol Filter {
    func apply(to image: UIImage?) -> UIImage?
    var thumbnail: Image { get }
}


class ColorFilter: Filter {
    @Published var filteredImage: UIImage?
    
    func apply(to image: UIImage?) -> UIImage? {
        // Implement Color filter
        // ...
        return filteredImage
    }

    var thumbnail: Image {
        // Provide thumbnail image
        // ...

        return Image(systemName: "circle.fill") // Placeholder image
    }
}

class GaussianBlurFilter: Filter {
    @Published var filteredImage: UIImage?
    
    func apply(to image: UIImage?) -> UIImage? {
        // Implement Color filter
        // ...
        return filteredImage
    }

    var thumbnail: Image {
        // Provide thumbnail image
        // ...

        return Image(systemName: "circle.fill") // Placeholder image
    }
}
class FishEyeFilter: Filter {
    @Published var filteredImage: UIImage?
    
    func apply(to image: UIImage?) -> UIImage? {
        // Implement Color filter
        // ...
        return filteredImage
    }

    var thumbnail: Image {
        // Provide thumbnail image
        // ...

        return Image(systemName: "circle.fill") // Placeholder image
    }
}
class SharpenFilter: Filter {
    @Published var filteredImage: UIImage?
    
    func apply(to image: UIImage?) -> UIImage? {
        // Implement Color filter
        // ...
        return filteredImage
    }

    var thumbnail: Image {
        // Provide thumbnail image
        // ...

        return Image(systemName: "circle.fill") // Placeholder image
    }
}
class CustomFilter: Filter {
    @Published var filteredImage: UIImage?
    
    func apply(to image: UIImage?) -> UIImage? {
        // Implement Color filter
        // ...
        return filteredImage
    }

    var thumbnail: Image {
        // Provide thumbnail image
        // ...

        return Image(systemName: "circle.fill") // Placeholder image
    }
}
