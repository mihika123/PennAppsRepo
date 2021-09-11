//
//  PlaylistCell.swift
//  PennAppsDemo
//
//  Created by Mihikaa Goenka on 9/7/21.
//

import UIKit

class PlaylistCell: UITableViewCell {
    
    var songImageView: UIImageView!
    var songNameLabel: UILabel!
    var infoLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songImageView = UIImageView()
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.cornerRadius = 6
        addSubview(songImageView)
        
        songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        songNameLabel.textColor = .white
        addSubview(songNameLabel)
        
        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = .white
        addSubview(infoLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        songImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        songImageView.heightAnchor.constraint(equalTo: songImageView.widthAnchor).isActive = true
        songImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        songImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        songNameLabel.leftAnchor.constraint(equalTo: songImageView.rightAnchor, constant: 7.5).isActive = true
        songNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        songNameLabel.widthAnchor.constraint(equalToConstant: frame.width * 0.75).isActive = true
        songNameLabel.heightAnchor.constraint(equalToConstant: 15)
        
        infoLabel.leftAnchor.constraint(equalTo: songNameLabel.leftAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 5).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: songNameLabel.widthAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalTo: songNameLabel.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
