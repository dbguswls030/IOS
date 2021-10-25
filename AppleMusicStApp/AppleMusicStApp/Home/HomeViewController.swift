//
//  HomeViewController.swift
//  AppleMusicStApp
//
//  Created by 유현진 on 2021/10/15.
//

import UIKit

class HomeViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource{
    // 몇 개 표시할까?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        // TODO: 트랙매니저에서 트랙갯수 가져오기
        return 10
    }
    
    // 셀을 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        // TODO: 셀 구성하기
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    // 헤더뷰를 어떻게 표시할까?
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            // TODO: 헤더 구성하기
            return UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
    
}

// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate{
    // 클릭했을 때 어떻게 할까
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: 곡 클릭 시 플레이어 뷰 띄우기
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 20 - card(width) - 20 card(width) - 20
        // TODO: 셀 사이즈 구하기
        let itemSpacing: CGFloat = 20
        let margin: CGFloat = 20
        let width = (collectionView.bounds.width - itemSpacing - margin * 2) / 2
        let height = width + 60
        return CGSize(width: width, height: height)
    }
}

