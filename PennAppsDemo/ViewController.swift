//
//  ViewController.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/5/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var playlistTableView: UITableView!
    var songs: [Song] = []
    var activeSongs: [Song] = []
    let filterCollectionViewHeight: CGFloat = 50
    
    var filters: [Filter] = []
    var activeGenreFilter: Set<GenreType> = []
    var activeTimeFilter: Set<TimeType> = []
    
    var filterCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        self.title = "Songs"
        
        songs = RestAPI.getSongs()
        activeSongs = songs
        filters = RestAPI.getFilters()
        
        playlistTableView = UITableView()
        playlistTableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        playlistTableView.separatorStyle = .none
        playlistTableView.translatesAutoresizingMaskIntoConstraints = false
        playlistTableView.register(PlaylistCell.self, forCellReuseIdentifier: "playlistTableViewCell")
        view.addSubview(playlistTableView)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: FilterCollectionViewFlowLayout())
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: "filterCollectionViewCell")
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        filterCollectionView.allowsMultipleSelection = true //this is how we select multiple cells at once
        view.addSubview(filterCollectionView)
        
        setConstraints()
    }
    
    func setConstraints() {
        playlistTableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 10).isActive = true
        playlistTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        playlistTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        playlistTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        filterCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: filterCollectionViewHeight).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        activeSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistTableViewCell", for: indexPath) as! PlaylistCell
        let song = activeSongs[indexPath.row]
        cell.songImageView.image = song.image
        cell.songNameLabel.text = song.name
        cell.infoLabel.text = "\(song.artist) • \(song.album)"
        cell.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = activeSongs[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.row = indexPath.row
        detailVC.song = song
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    //add filter
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell else { return }
        let currentFilter = filters[indexPath.item]
        changeFilter(filter: currentFilter, shouldRemove: false)
        playlistTableView.reloadData()
    }
    
    //remove filter
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell else { return }
            let currentFilter = filters[indexPath.item]
            changeFilter(filter: currentFilter, shouldRemove: true)
            playlistTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCollectionViewCell", for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
            let filter = filters[indexPath.item]
            cell.setup(with: filter.filterTitle)
            return cell
    }

    //inserts or removes a filter into the acitveFilters then filters the restaurants accordingly
    func changeFilter(filter: Filter, shouldRemove: Bool = false) {
        if let genreType = filter as? GenreType {
            if shouldRemove {
              activeGenreFilter.remove(genreType)
            } else {
                activeGenreFilter.insert(genreType)
            }
        }
        if let timeType = filter as? TimeType {
            if shouldRemove {
                activeTimeFilter.remove(timeType)
            } else {
               activeTimeFilter.insert(timeType)
            }
        }
        filterSongs() //now filter the songs according to our activeFilters
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func filterSongs() {
        if activeGenreFilter.count == 0 && activeTimeFilter.count == 0{
            activeSongs = songs
            return
        }
        activeSongs = songs.filter({ r in
            var genreFilteredOut = activeGenreFilter.count > 0
            if activeGenreFilter.count > 0 {
                for genre in r.genre {
                    if activeGenreFilter.contains(genre) {
                        genreFilteredOut = false
                    }
                }
            }
            
            var timeFilteredOut = activeTimeFilter.count > 0
            if activeTimeFilter.count > 0 {
                if activeTimeFilter.contains(r.time) {
                    timeFilteredOut = false
                }
            }
            return !(genreFilteredOut || timeFilteredOut)
        })
    }
}

