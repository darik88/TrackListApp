//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Айдар Рахматуллин on 04.11.2020.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    @IBOutlet var artCoverImageView: UIImageView!
    @IBOutlet var trackLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artCoverImageView.image = UIImage(named: track.track)
        trackLabel.text = track.track
    }
}
