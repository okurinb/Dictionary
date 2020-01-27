//
//  WordDescriptionViewController.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit
import SDWebImage

class WordDescriptionViewController: UIViewController {
    var viewModel = WordDescriptionsViewModel()
    var meaningId: Int!
    
    @IBOutlet weak var meaningImageView: UIImageView!
    @IBOutlet weak var meaningText: UILabel!
    @IBOutlet weak var meaningTranslation: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.meaningText.text = nil
        self.meaningTranslation.text = nil
        self.activityIndicator.startAnimating()
        self.viewModel.loadMeaning(meaningId: self.meaningId,
                              completion: { [weak self] in
                                self?.updateView()
        }) { (error) in
            
        }
    }
    
    func updateView() {
        guard let meaning = self.viewModel.meaning else { return }
        self.meaningImageView?.sd_setImage(with: URL(string: meaning.imageUrl),
                                           placeholderImage: UIImage(named: "placeholder"),
                                           options: [],
                                           progress: nil,
                                           completed: {  [weak self] (_,_,_,_) in
                                            self?.activityIndicator.stopAnimating()
                                            self?.activityIndicator.isHidden = true
                                            
        })
        
        self.meaningText.text = meaning.text
        self.meaningTranslation.text = meaning.translation
    }
}
