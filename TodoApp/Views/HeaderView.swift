//
//  HeaderView.swift
//  TodoApp
//
//  Created by MAC on 8/28/25.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subTitle:String
    let angle:Double
    let background:Color
      
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle))
            
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300).offset(y:-100 ) 
    }
}

#Preview {
    HeaderView(title: "Hello", subTitle: "Todo", angle: 15, background: Color.blue)
}
