//
//  NavigationEnum.swift
//  Hackathon
//
//  Created by Chandan Kasamsetty on 20/06/24.
//

import Foundation
import SwiftUI

enum NavigationEnum : Hashable, View{
    case Gallery
    case GalleryAPI
    case CardView(title: String, image: UIImage? = nil)
    case Checkout
    case UploadImage
    case UploadedImage(image: UIImage)

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: NavigationEnum, rhs: NavigationEnum) -> Bool {
        switch (lhs, rhs) {
        case (.Gallery, .Gallery):
            return true
        case (.GalleryAPI, .GalleryAPI):
            return true
        case (.Checkout, .Checkout):
            return true
        case (.CardView(let lhsItem, let lhsItem2), .CardView(let rhsItem, let rhsItem2)):
            return (lhsItem == rhsItem) && (lhsItem2 == rhsItem2)
        case (.UploadImage, .UploadImage):
            return true
        case (.UploadedImage(let lhsItem), .UploadedImage(let rhsItem)):
            return lhsItem == rhsItem
        default:
            return false
        }
    }

    
    var body : some View {
        switch self{
        case .GalleryAPI:
            ContentViewWithAPI()
        case .Gallery:
            ContentView()
        case .CardView(let title, let image):
            SelectedCardView(imageTitle: title, image: image)
        case .Checkout:
            CheckoutPage()
        case .UploadImage:
            UploadImageView()
        case .UploadedImage(let image):
            DraggableView(selectedImage: image, originalImage: image)
        }
    }
    
}
