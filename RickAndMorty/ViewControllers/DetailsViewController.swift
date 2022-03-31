//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Tipachel on 28.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var characterImageView: CharacterImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.width / 2
        }
    }
    @IBOutlet var descriptionLabel: UILabel!
    
    var character: Character!
    
    private var spinnerView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        title = character.name
        descriptionLabel.text = character.description
        characterImageView.fetchImage(from: character.image)
    }
}
