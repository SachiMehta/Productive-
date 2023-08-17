//
//  ToDo.swift
//  Productive+
//
//  Created by scholar on 8/16/23.
//

import SwiftUI

struct ToDo: View {
    var body: some View {
        ZStack{
            Image("todo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            //cut overflow scrollable div
            Rectangle()
                .frame(width: 250.0, height: 350.0)
                .foregroundColor(.white)
                .overlay(
                    ScrollView
                    {
                        VStack(alignment: .leading){
                            
                        }
                        
                    }
                )
                .position(x:200, y:375)
        }
        
    }
}

struct ToDo_Previews: PreviewProvider {
    static var previews: some View {
        ToDo()
    }
}
