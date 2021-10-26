//
//  OnboardingViewController.swift
//  AHMH
//
//  Created by 장선영 on 2021/10/20.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!
    
    var slides: [OnboardingSlide] = [
        .init(title: "Informations", description: "지원 정책, 육아 서적, 육아 컬럼 등 다양한 정보를 얻을 수 있어요.", image: #imageLiteral(resourceName: "informationImage")),
        .init(title: "Facilities", description: "위치 서비스를 통해 내 근처 보육시설을 간편히 알 수 있어요.", image: #imageLiteral(resourceName: "locationImage")),
        .init(title: "Connections", description: "위치 서비스를 통해 내 근처의 돌보미를 알 수 있어요", image: #imageLiteral(resourceName: "locationHandImage")),
        .init(title: "Community", description: "나이대 별 커뮤니티를 통해 아이의 성장에 맞는 의견을 교류할 수 있어요", image: #imageLiteral(resourceName: "CommunityImage"))
    ]
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
      
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
//            let controller = storyboard?.instantiateViewController(identifier: "LoginNC") as! UINavigationController
            let controller = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
//            controller.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(controller, animated: true)
//            present(controller, animated: true, completion: nil)
            print("Go to the next page")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // collectionview scroll -> pagecontrol notice
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
