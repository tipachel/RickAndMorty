//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Tipachel on 28.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var characterImageView: UIImageView! {
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
        showSpinner(in: view)
        title = character.name
        descriptionLabel.text = character.description
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
                self.spinnerView.stopAnimating()
            }
        }
    }
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerView.center = characterImageView.center
        spinnerView.hidesWhenStopped = true
        
        view.addSubview(spinnerView)
    }
    
}
