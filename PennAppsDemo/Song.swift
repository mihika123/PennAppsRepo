//
//  Song.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/9/21.
//

import UIKit

protocol Filter {
    var filterTitle: String { get }
}

enum GenreType: Filter {
    case pop
    case hiphop
    case edm
    case rock
    case country
    
    var filterTitle: String { //return the enum title with first letter uppercased
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [GenreType] {
        return [.pop, .hiphop, .edm, .rock, .country]
    }
}

enum TimeType: Filter {
    case old //anything released before 2010
    case recent //anything released between 2010 and 2019
    case new //anything released after 2019
    
    var filterTitle: String {
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [TimeType] {
        return [.old,.recent,.new]
    }
}

class Song {
    
    var name: String
    var artist: String
    var album: String
    var image: UIImage
    var genre: [GenreType]
    var time: TimeType
    
    init(name: String, artist: String, album: String, image: UIImage, genre: [GenreType], time: TimeType) {
        self.name = name
        self.artist = artist
        self.album = album
        self.image = image
        self.genre = genre
        self.time = time
    }
}

