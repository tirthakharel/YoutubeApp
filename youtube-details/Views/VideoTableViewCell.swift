//
//  VideoTableViewCell.swift
//  youtube-details
//
//  Created by Tirtha Kharel on 7/19/20.
//  Copyright © 2020 Tirtha Kharel. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }

}
