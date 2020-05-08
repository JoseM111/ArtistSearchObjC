import UIKit

class ArtistListTableViewController: UITableViewController {
    
    @IBOutlet weak var artistSearchBar: UISearchBar!
    
    var artistSearchResults: [JMArtist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistSearchBar.delegate = self
    }

    // MARK: - Table view data source

    /**©------------------------------------------------------------------------------©*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        artistSearchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath)
            as? ArtistTableViewCell else { return UITableViewCell() }

        let artist = artistSearchResults[indexPath.row]
        cell.artist = artist
        
        return cell
    }
    /**©------------------------------------------------------------------------------©*/
}

extension ArtistListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else { return }
        JMArtistModelController.fetchArtist(forSearchTerm: searchTerm) { (artists) in
            
            guard let artists = artists else { return }
            self.artistSearchResults = artists
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.artistSearchBar.text = ""
            }
        }
    }
}
