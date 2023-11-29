//
//  VideoPlayerView.swift
//  CatStaGram
//
//  Created by 김세아 on 11/29/23.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper? // 영샹 반복재생 관련
    var queuePlayer: AVQueuePlayer? // 영상 재생 순서 관련
    var urlStr: String

    init(frame: CGRect, urlStr: String) {
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup() {
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
