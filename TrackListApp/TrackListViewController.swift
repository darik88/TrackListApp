//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Айдар Рахматуллин on 03.11.2020.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        navigationItem.leftBarButtonItem = editButtonItem
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackDetailsVC = segue.destination as! TrackDetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        trackDetailsVC.track = trackList[indexPath.row]
    }

}

// MARK: - Table view data source
extension TrackListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        let track = trackList[indexPath.row]
        cell.textLabel?.text = track.song
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = track.artist
        cell.imageView?.image = UIImage(named: track.track)
        return cell
    }
}

// MARK: - Table view delegate
extension TrackListViewController {
//    // высота ячейки
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        80
//    }
    
    // Скрытие кнопки редактирования у ячейки
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    // отключение сдвига ячейки при нажатии на Edit
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // Перемещение ячейки в списке
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // убрать ячейку из списка по индексу массива (устанавливается при выделении ячейки)
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        
        // Вставка ячейки в список по индексу назначения
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
}
