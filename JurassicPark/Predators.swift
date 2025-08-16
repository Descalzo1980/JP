//
//  Predators.swift
//  JurassicPark
//
//  Created by Станислав Леонов on 16.08.2025.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredaterData()
    }
    
    func decodeApexPredaterData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decode = JSONDecoder()
                decode.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decode.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decode JSON data: \(error)")
            }
        }
    }
}
