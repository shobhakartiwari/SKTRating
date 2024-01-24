//
//  STRating.swift
//  STRating
//
//  Created by Shobhakar Tiwari on 1/22/24.
//

import SwiftUI

public struct SKTRating: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width:Int = 40
    var openSFSymbol:String = "star"
    var fillSFSymbol:String = "star.fill"
    
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 30, openSFSymbol: String = "star", fillSFSymbol: String = "star.fill") {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.openSFSymbol = openSFSymbol
        self.fillSFSymbol = fillSFSymbol
    }
    
    public var body: some View {
        HStack{
            ForEach(0 ..< maxRating, id: \.self){ rating in
                Image(systemName: rating < self.currentRating ? self.fillSFSymbol : self.openSFSymbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
                    .onTapGesture {
                        print("Star tapped! Current Rating: \(self.currentRating), New Rating: \(rating + 1)")

                        self.currentRating = rating + 1
                    }
                
            }
        }.frame(width: CGFloat(maxRating * width))
    }
}
