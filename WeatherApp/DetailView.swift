//
//  DetailView.swift
//  WeatherApp
//
//  Created by Mário Markovič on 16/05/2023.
//

import SwiftUI

struct DetailView: View {
    let locality: Localite
    
    var body: some View {
        Text(locality.name)
        Text("\(locality.latitude)")
        Text("\(locality.longitude)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bs = Localite(name: "Banská Štiavnica",latitude: 48.4587,longitude: 18.8931)
        DetailView(locality: bs)
    }
}
