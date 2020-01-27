//
//  SearchWordsViewController.swift
//  DictionaryTest
//
//  Created by Борис Окурин on 27.01.2020.
//  Copyright © 2020 Boris Okurin. All rights reserved.
//

import UIKit
import SDWebImage

class SearchWordsViewController: UIViewController {

    let viewModel = SearchWordsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showMeaning(meaningId: Int) {
        let storyboard = UIStoryboard.init(name: "Dictionary", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "WordDescriptionViewController") as! WordDescriptionViewController
        viewController.meaningId = meaningId
        self.present(viewController, animated: true, completion: nil)
    }

}

extension SearchWordsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(text: searchText, completion: {
            self.tableView.reloadData()
        }) { (error) in
            
        }
    }
}

extension SearchWordsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfElementsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeaningPreviewCell", for: indexPath) as! MeaningPreviewCell
        let meaning = self.viewModel.objectAt(indexPath: indexPath)
        cell.meaningLabel.text = meaning.text
        cell.meaningImageView?.sd_setImage(with: URL(string: meaning.imageUrl),
                                    placeholderImage: UIImage(named: "placeholder"),
                                    options: [],
                                    context: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordHeaderCell") as! WordHeaderCell
        cell.wordLabel.text = self.viewModel.textFor(section: section)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meaning = self.viewModel.objectAt(indexPath: indexPath)
        self.showMeaning(meaningId: meaning.meaningId)
    }
    
}
