//
//  DetailViewController.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var row: Int!
    var song: Song!
    
    var songLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var songText: UILabel!
    var artistText: UILabel!
    var albumText: UILabel!
    var songImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = song.name
        view.backgroundColor = .black
        
        songLabel = UILabel()
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.textAlignment = .center
        songLabel.text = "Song:"
        songLabel.textColor = .white
        songLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.addSubview(songLabel)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.textAlignment = .center
        artistLabel.text = "Artist:"
        artistLabel.textColor = .white
        artistLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.addSubview(artistLabel)
        
        albumLabel = UILabel()
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        albumLabel.textAlignment = .center
        albumLabel.text = "Album:"
        albumLabel.textColor = .white
        albumLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.addSubview(albumLabel)
        
        songText = UILabel()
        songText.translatesAutoresizingMaskIntoConstraints = false
        songText.textColor = .white
        songText.textAlignment = .left
        songText.text = song.name
        songText.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(songText)
        
        artistText = UILabel()
        artistText.translatesAutoresizingMaskIntoConstraints = false
        artistText.textColor = .white
        artistText.textAlignment = .left
        artistText.text = song.artist
        artistText.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(artistText)
        
        albumText = UILabel()
        albumText.translatesAutoresizingMaskIntoConstraints = false
        albumText.text = song.album
        albumText.textColor = .white
        albumText.textAlignment = .left
        albumText.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(albumText)
        
        songImageView = UIImageView()
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        songImageView.contentMode = .scaleAspectFill
        songImageView.image = song.image
        view.addSubview(songImageView)
        
        setConstraints()
    }
    
    // MARK: - CONSTRAINTS
    func setConstraints() {
        songLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        songLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        songLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        songLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        artistLabel.leftAnchor.constraint(equalTo: songLabel.leftAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 24).isActive = true
        artistLabel.widthAnchor.constraint(equalTo: songLabel.widthAnchor).isActive = true
        artistLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor).isActive = true
        
        albumLabel.leftAnchor.constraint(equalTo: songLabel.leftAnchor).isActive = true
        albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 24).isActive = true
        albumLabel.widthAnchor.constraint(equalTo: songLabel.widthAnchor).isActive = true
        albumLabel.heightAnchor.constraint(equalTo: songLabel.heightAnchor).isActive = true
        
        songText.leftAnchor.constraint(equalTo: songLabel.rightAnchor, constant: 10).isActive = true
        songText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -18).isActive = true
        songText.heightAnchor.constraint(equalToConstant: 30).isActive = true
        songText.centerYAnchor.constraint(equalTo: songLabel.centerYAnchor).isActive = true
        
        artistText.leftAnchor.constraint(equalTo: songText.leftAnchor).isActive = true
        artistText.centerYAnchor.constraint(equalTo: artistLabel.centerYAnchor).isActive = true
        artistText.rightAnchor.constraint(equalTo: songText.rightAnchor).isActive = true
        artistText.heightAnchor.constraint(equalTo: songText.heightAnchor).isActive = true
        
        albumText.leftAnchor.constraint(equalTo: songText.leftAnchor).isActive = true
        albumText.centerYAnchor.constraint(equalTo: albumLabel.centerYAnchor).isActive = true
        albumText.rightAnchor.constraint(equalTo: songText.rightAnchor).isActive = true
        albumText.heightAnchor.constraint(equalTo: songText.heightAnchor).isActive = true
        
        songImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        songImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        songImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        songImageView.topAnchor.constraint(equalTo: albumText.bottomAnchor, constant: 100).isActive = true
    }
}
