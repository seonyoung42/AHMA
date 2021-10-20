//
//  HomeViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/17.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var communityCollectionView: UICollectionView!
    @IBOutlet var bookCollectionView: UICollectionView!
    
    var communities : [CommunityCategory] = [
        .init(id: "id1", name: "0~2세", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", name: "3~5세", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", name: "6~8세", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", name: "9~11세", image: (UIImage(named: "baby-1")?.pngData())!)
    ]
    
    var books: [Book] = [
        .init(id: "id1", title: "일단 시작해 봐!: 이명랑 청소년 소설", author: "지은이: 이명랑 그림: 뻑새", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", title: "일단 시작해 봐!: 이명랑 청소년 소설", author: "지은이: 이명랑 그림: 뻑새", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", title: "일단 시작해 봐!: 이명랑 청소년 소설", author: "지은이: 이명랑 그림: 뻑새", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", title: "일단 시작해 봐!: 이명랑 청소년 소설", author: "지은이: 이명랑 그림: 뻑새", image: (UIImage(named: "baby-1")?.pngData())!),
        .init(id: "id1", title: "일단 시작해 봐!: 이명랑 청소년 소설", author: "지은이: 이명랑 그림: 뻑새", image: (UIImage(named: "baby-1")?.pngData())!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 254/255, green: 249/255, blue: 239/255, alpha: 1))
        
        self.navigationItem.title = "AHMH"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 252/255, green: 243/255, blue: 202/255, alpha: 1))
        
        self.communityCollectionView.delegate = self
        self.communityCollectionView.dataSource = self
        
        self.bookCollectionView.delegate = self
        self.bookCollectionView.dataSource = self
        
        registerCells()

        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        communityCollectionView.register(UINib(nibName: CommunityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CommunityCollectionViewCell.identifier)
        bookCollectionView.register(UINib(nibName: BookCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var email = Auth.auth().currentUser?.email ?? "고객"
        
        if Auth.auth().currentUser?.displayName != nil {
            email = (Auth.auth().currentUser?.displayName)!
        } else {
            email = Auth.auth().currentUser?.email ?? "고객"
        }
        
        welcomeLabel.text = """
        안녕하세요
        \(email)님
        """
        
        welcomeLabel.textColor = UIColor.black
    }
    
    @IBAction func profileUpdateButtonTapped(_ sender: Any) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = "선영"
        changeRequest?.commitChanges { _ in
            let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? "고객"
            self.welcomeLabel.text = """
            안녕하세요 \(displayName)님
            """
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case communityCollectionView:
            return communities.count
        case bookCollectionView:
            return books.count
        default:
            return 0
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        
        case communityCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommunityCollectionViewCell.identifier, for: indexPath) as! CommunityCollectionViewCell
            cell.setup(category: communities[indexPath.row])
            return cell
           
        case bookCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
            cell.setup(book: books[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
       
    }
    
    
}
