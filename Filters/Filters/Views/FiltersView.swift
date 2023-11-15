//
//  FiltersView.swift
//  Filters
//
//  Created by Hassan Jillani Farooqi on 15/11/2023.
//

import SwiftUI
import Metal

struct FiltersView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var selection: ImagesModel?
    
    var filtersArray : [ImagesModel] = []
    let startDate = Date()
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.gray)
                })
                
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            
//            if let image = UIImage(data: selection!.imageData!) {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: UIScreen.main.bounds.width)
//
//            }
            
            switch selection?.filterType() {
            case .FilterTypeNoise:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .colorEffect(ShaderLibrary.noise (.float(1)))

                }
            case .FilterTypePixellate:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .layerEffect(ShaderLibrary.pixellate(.float(5)), maxSampleOffset: .zero)

                }
            case .FilterTypeWave:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .visualEffect { content, proxy in
                            content
                                .distortionEffect(ShaderLibrary.complexWave(
                                    .float(500),
                                    .float2(proxy.size),
                                    .float(0.5),
                                    .float(8),
                                    .float(10)
                                ), maxSampleOffset: .zero)
                        }

                }
            case .FilterTypeEmboss:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)
                        .layerEffect(ShaderLibrary.emboss(.float(15)), maxSampleOffset: .zero)

                }
            case .FilterTypeUnknown:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)

                }
            case nil:
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width)

                }
            }
            
            VStack (alignment: .leading) {
                Text("Trendy")
                    .padding([.leading], 1)
                
                ScrollView (.horizontal) {
                    FilterdImages(selection: $selection)
                }
                
                Spacer()
            }
            .padding([.leading, .trailing], 16)
            Spacer()
        }
        
    }
}

#Preview {
    FiltersView()
}

struct FilterdImages: View {
    
    @Binding var selection: ImagesModel?
    
    var body: some View {
        HStack {
            
            VStack {
                
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }

                Text("Origional".capitalized)
                    .font(Font.system(size: 14))
            }
            .onTapGesture {
                self.selection?.filterName = "or"
            }
            
            VStack {
                
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .layerEffect(ShaderLibrary.emboss(.float(15)), maxSampleOffset: .zero)

                        .clipped()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }

                Text("Emboss".capitalized)
                    .font(Font.system(size: 14))
            }
            .onTapGesture {
                self.selection?.filterName = "emboss"
            }
            VStack {
          
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .colorEffect(ShaderLibrary.noise (.float(1)))

                        .clipped()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }

                
                Text("Noise".capitalized)
                    .font(Font.system(size: 14))
            }
            .onTapGesture {
                self.selection?.filterName = "noise"
            }
            VStack {
               
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .layerEffect(ShaderLibrary.pixellate(.float(5)), maxSampleOffset: .zero)

                        .clipped()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }

                Text("Pixellate".capitalized)
                    .font(Font.system(size: 14))
            }
            .onTapGesture {
                self.selection?.filterName = "pixellate"
            }
            VStack {
                
                if let image = UIImage(data: selection!.imageData!) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .visualEffect { content, proxy in
                            content
                                .distortionEffect(ShaderLibrary.complexWave(
                                    .float(500),
                                    .float2(proxy.size),
                                    .float(0.5),
                                    .float(8),
                                    .float(10)
                                ), maxSampleOffset: .zero)
                        }

                        .clipped()
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    
                }

                
                Text("complex Wave".capitalized)
                    .font(Font.system(size: 14))
            }
            .onTapGesture {
                self.selection?.filterName = "complexWave"
            }
        }
    }
}


