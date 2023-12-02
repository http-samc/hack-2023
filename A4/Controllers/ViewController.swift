//
//  ViewController.swift
//  A4
//
//  Created by Vin Bui on 10/31/23.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    // MARK: - Properties (view)
    
    private var SessionCollectionView: UICollectionView!
    private var FilterCollectionView: UICollectionView!
    
    // MARK: - Properties (data)
    private var sessions: [Sesh] = []

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        let logo = UIImageView(image: UIImage(named: "Logo"))
        navigationItem.titleView = logo
        
        view.backgroundColor = UIColor.a4.black
        getSessions()
        setupCollectionView()
    }
    
    // MARK: - Networking
    
    @objc private func getSessions() {
        NetworkManager.shared.getSessions { [weak self] sessions in
            guard let self = self else { return }
            self.sessions = sessions
            DispatchQueue.main.async {
                self.SessionCollectionView.reloadData()
            }
            
        }
        
    }

    // MARK: - Set Up Views
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 24
        
        SessionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        SessionCollectionView.backgroundColor = UIColor.a4.black
        SessionCollectionView.register(SessionCollectionViewCell.self, forCellWithReuseIdentifier: SessionCollectionViewCell.reuse)
        SessionCollectionView.delegate = self
        SessionCollectionView.dataSource = self
        SessionCollectionView.alwaysBounceVertical = true
        
        let flowLayout2 = UICollectionViewFlowLayout()
        flowLayout2.scrollDirection = .horizontal
        flowLayout2.minimumInteritemSpacing = 100
  

        
        FilterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout2)
        FilterCollectionView.register(FilterView.self, forCellWithReuseIdentifier: FilterView.reuse)
        FilterCollectionView.delegate = self
        FilterCollectionView.dataSource = self
        FilterCollectionView.alwaysBounceHorizontal = true
     
        view.addSubview(SessionCollectionView)
        view.addSubview(FilterCollectionView)
        
        SessionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        FilterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            FilterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            FilterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            FilterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            FilterCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -590)
            
        ])
        NSLayoutConstraint.activate([
            SessionCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SessionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SessionCollectionView.topAnchor.constraint(equalTo: FilterCollectionView.bottomAnchor),
            SessionCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    
    }
    
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == SessionCollectionView) {
            let session = sessions[indexPath.row]
            let sessionPage = SessionController(title: session.title, date: SessionCollectionViewCell.formatDateString(session.startTime)!, duration: SessionCollectionViewCell.getDuration(dateString1: session.startTime, dateString2: session.endTime)!, desc: session.description, location: session.location, class_: session.course, users: session.users)
            navigationController?.pushViewController(sessionPage, animated: true)
        }
        else {
            // Filtering
    
        }
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  SessionCollectionViewCell.reuse, for: indexPath) as?
                SessionCollectionViewCell {
                let session = sessions[indexPath.row]
                cell.configure(sesh: session)
                return cell
            }
        
        
        return UICollectionViewCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (collectionView == SessionCollectionView) {
            return 1
        }
        else {
            return 1
        }
    }

}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == FilterCollectionView) {
            return CGSize(width: 116, height: 32)
        }
        else if (collectionView == SessionCollectionView) {
            let size = collectionView.frame.width - 16
            return CGSize(width: size, height: 180)
        }
        return CGSize(width: 216, height: 216)
    }
}

