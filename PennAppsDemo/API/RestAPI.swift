//
//  RestAPI.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/9/21.
//

import Foundation
import UIKit

class RestAPI {
    
    static func getSongs() -> [Song] {
        let song1 = Song(name: "Gang Related", artist: "Logic", album: "Under Pressure", image: UIImage(named: "underpressure")!, genre: [.hiphop], time: .recent)
        let song2 = Song(name: "Walk On Water (ft. Beyonce)",artist: "Eminem", album: "Revival", image: UIImage(named: "revival")!, genre: [.hiphop], time: .recent)
        let song3 = Song(name: "Fine Apple", artist: "Nic D", album: "Fine Apple", image: UIImage(named: "fine_apple")!, genre: [.hiphop, .pop], time: .new)
        let song4 = Song(name: "First Day Out", artist: "Tee Grizzley", album: "My Moment", image: UIImage(named: "mymoment")!, genre: [.hiphop], time: .recent)
        let song5 = Song(name: "Liability", artist: "Lorde", album: "Melodrama", image: UIImage(named: "melodrama")!, genre: [.pop], time: .recent)
        let song6 = Song(name: "34+35", artist: "Ariana Grande", album: "Positions", image: UIImage(named: "yourstruly")!, genre: [.pop], time: .new)
        let song7 = Song(name: "Mercy", artist: "Shawn Mendes", album: "Illuminate", image: UIImage(named: "illuminate")!, genre: [.pop, .rock], time: .recent)
        let song8 = Song(name: "One Call Away", artist: "Charlie Puth", album: "Nine Track Mind", image: UIImage(named: "ninetrackmind")!, genre: [.pop], time: .recent)
        let song9 = Song(name: "Midnight Train", artist: "Sam Smith", album: "The Thrill Of It All", image: UIImage(named: "thrillofitall")!, genre: [.pop], time: .recent)
        let songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9]
        return songs
    }
    
    static func getFilters() -> [Filter] {
        var filters: [Filter] = []
        filters.append(contentsOf: GenreType.allValues().map({ f in f as Filter }))
        filters.append(contentsOf: TimeType.allValues().map({ f in f as Filter }))
        return filters
    }
}

