//
//  ReelsViewController.swift
//  CatStaGram
//
//  Created by 김세아 on 11/29/23.
//

import UIKit
import SnapKit

class ReelsViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0
    
    // 동영상 이름 지정
    private let videoURLStrArr = ["dummy2", "dummy3", "dummy4", "dummy5", "dummy6", "dummy7"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    

    //MARK: - Actions
    
    
    
    //MARK: - Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.register(ReelsCell.self, forCellWithReuseIdentifier: ReelsCell.identifier)
        
        startLoop()
    }
    
    private func startLoop() {
        // 3초마다 자동 전환
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            self.moveNextPage()
        }
    }
    private func moveNextPage() {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        nowPage += 1
        if (nowPage >= itemCount) {
            // 마지막 페이지일 때
            nowPage = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: nowPage, section:  0), at: .centeredVertically, animated: true)
    }
    
}

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCell.identifier, for: indexPath) as? ReelsCell else { return UICollectionViewCell() }
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanup()
            // cleanup을 활용해 메모리 관리
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    // cell 좌우 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    // cell 간 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
