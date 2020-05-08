import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    // MARK: _@IBOutlet
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artistRatingLabel: UILabel!
    

    var artist: JMArtist? {
        didSet {
            guard let artist = artist else { return }
            artistNameLabel.text = artist.artistName
            artistRatingLabel.text = "Listener Rating: \(artist.artistRating)"
        }
    }

}
