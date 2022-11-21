//
//  DetailCoffeeshop.swift
//  CoffeFinder
//
//  Created by Muhammad Jafar Ash Siddiq on 21/11/22.
//

import SwiftUI

struct DetailCoffeeshop: View {
    
    //MARK: - PROPERTIES
    let coffeeshopDetail : Coffeeshop
    //MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white,.blue,], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Image(coffeeshopDetail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250,height: 250)
                    .clipShape(Circle())
                    .overlay{
                        ZStack{
                            Circle().opacity(0.5 )
                            VStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus").renderingMode(.original)
                                    .foregroundColor(.blue)
                                    .font(.system(size: 50))
                                Text(coffeeshopDetail.name)
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.system(size: 30,design: .rounded))
                                
                            }
                        }
                    }
                Text(coffeeshopDetail.review)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 18,design: .rounded))
                    .lineSpacing(3)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
                
                HStack {
                    Image(systemName: "pin.circle")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                    Text(coffeeshopDetail.location)
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                }
            }
            .padding()
            
            
        }
    }
}

struct DetailCoffeeshop_Previews: PreviewProvider {
    static var previews: some View {
        DetailCoffeeshop(
            coffeeshopDetail:
                Coffeeshop(
                    image: "bojaeatery",
                    name: "Boja Eatery",
                    location: "Jl. Sumatera No. 21, Kota Bandung",
                    review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"
                )
        )
    }
}
