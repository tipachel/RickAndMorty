//
//  TableView.swift
//  RickAndMorty
//
//  Created by Tipachel on 30.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: CharacterImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
  
    
    func configure(with character: Character?) {
        nameLabel.text = character?.name
        characterImageView.fetchImage(from: character?.image ?? "")
    }
}

