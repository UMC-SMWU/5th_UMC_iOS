//
//  ProfileViewController.swift
//  CatStaGram
//
//  Created by 김세아 on 11/13/23.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var  userPosts: [GetUserPosts]? {
        // data 값이 변경되었을 때 UI를 다시 그리게 됨
        // 네트워크 연결이 먼저인지 UI가 먼저인지 순서를 확인해 볼 필요가 있음
        didSet { self.profileCollectionView.reloadData() }
    }
    
    var deletedIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        setupData()
    }
    
    
    // MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
        // 오래 눌렀을 때에만 작동하게 만들기 위해, 즉 버그를 막기 위해 하기 코드 작성
        if gestureRecognizer.state != .began { return }
        
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
            print("debug: ", indexPath.item)
            
            guard let userPosts = self.userPosts else {return}
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx {
                // 삭제 API 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
            
            
            
        }
        
    }
    
    // MARK: - Helpers
    private func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        //cell 등록
        profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        
        //PostCollectionViewCell
        profileCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
        
    }
    
    private func setupData() {
        UserFeedDataManager().getUserFeed(self)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource1
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    //섹션의 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //셀이 2개이므로 조건문으로 서로 다르게 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            //cell 개수를 반드시 정확히 만들어 줘야 index error 발생 X
            return userPosts?.count ?? 0
        }
    }
    
    //분기문 처리를 통해 셀 2개 별도로 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                return UICollectionViewCell()
                //fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        default :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                return UICollectionViewCell()
                //fatalError("셀 타입 캐스팅 실패")
            }
            
            let itemIndex = indexPath.item
            
            // 데이터가 있는 경우 cell에 데이터 전달
            if let cellData = self.userPosts {
                cell.setupData(cellData[itemIndex].postImgUrl)
            }
            
            return cell
            
        }
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section{
        case 0:
            return CGSize(width: collectionView.frame.width, height: CGFloat(159))
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4 / 3))
            return CGSize(width: side, height: side)
        }
    }
    
    //열 간 간격 관련 여백 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    //행 간 간격 관련 여백 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        if isSuccess { return }
        
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
