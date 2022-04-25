//
//  CircleImage.swift
//  TestHeadless-1
//
//  Created by Vivek Narayanan on 23/02/2022.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("spiderman").clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
