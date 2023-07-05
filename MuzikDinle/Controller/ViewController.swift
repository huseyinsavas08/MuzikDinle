//
//  ViewController.swift
//  MuzikDinle
//
//  Created by Hüseyin Savaş on 4.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        configureSongs()
    }
    
    func configureSongs() {
        songs.append(Song(name: "Clinic Weekend", albumName: "Coeurdemarie", artistName: "Dance", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Blocboy", albumName: "Corpo Feminino", artistName: "D4m Sloan", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Deservingjoy", albumName: "Duesexmachinatypebeat", artistName: "Grone", imageName: "cover2", trackName: "song2"))
        
        songs.append(Song(name: "Department Of Education", albumName: " Colonie", artistName: "Dark Notes", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Denise Mazzola", albumName: "Cristianaaguilera", artistName: "Ensemble", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "D-Block S-Te-Fan", albumName: "Colourbox", artistName: "D-Minus", imageName: "cover2", trackName: "song2"))
        
        songs.append(Song(name: "Contemporary R&B", albumName: "Darbe", artistName: "Frankapp", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Consolidationsoftware", albumName: "Europemusic", artistName: "Denuevo", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Drah Neet", albumName: "Clairolfaction", artistName: "Cypher Type Beat", imageName: "cover2", trackName: "song2"))
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        
        cell.accessoryType = .disclosureIndicator
        
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else { return }
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
