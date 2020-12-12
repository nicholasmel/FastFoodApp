
import UIKit

class FoodTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

