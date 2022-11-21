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
        Text("Detail Coffe Shop")
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
