//
//  ViewController.swift
//  DosTube
//
//  Created by Mahmoud Eldesouky on 7/4/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
      
        let dosChannel = Channel()
        dosChannel.name = "Dos Official"
        dosChannel.profilePictureName = "pp"

        let kanyeChannel = Channel()
        kanyeChannel.name = "KanyeIsTheBestChannel"
        kanyeChannel.profilePictureName = "kanye_profile"
       
        let swiftChannel = Channel()
        kanyeChannel.name = "TaylorSwiftVEVO"
        kanyeChannel.profilePictureName = "taylor_swift_profile"
        
        let blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 23932843093
        
        let badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 57989654934
        
        let golfSevenVideo = Video()
        golfSevenVideo.thumbnailImageName = "VII"
        golfSevenVideo.title = "GOlf VII - Barcelona, Spain"
        golfSevenVideo.channel = dosChannel
        golfSevenVideo.numberOfViews = 7482255934

        
        let familyTripVideo = Video()
        familyTripVideo.thumbnailImageName = "trip"
        familyTripVideo.title = "Eldesouky's Awsome Family Trip - Istanbul, Turkey"
        familyTripVideo.channel = dosChannel
        familyTripVideo.numberOfViews = 7482255934
        
        return [blankSpaceVideo, badBloodVideo, golfSevenVideo, familyTripVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false // give it a darker color
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        let titleLabel = UILabel(frame: CGRectMake(0,0,view.frame.width - 32, view.frame.height))
        titleLabel.text = "  Home"
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.textColor = UIColor.whiteColor()
        navigationItem.titleView = titleLabel
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cell")
        
        // push the home collection view and its scroll view down by 50
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
        setupNavBarButtons()
        print("home root: \(self.view.window?.rootViewController)")
    }
    
    let menuBar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    
    private func setupMenuBar(){
        navigationController?.hidesBarsOnSwipe = true
       
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)//removed constrain: V:|[v0(50)]
        
        menuBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true

    }
    private func setupNavBarButtons(){
                                                        // makes the search UIimage white
        let searchImage = UIImage(named: "search_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let searchBarButton = UIBarButtonItem(image: searchImage, style: .Plain, target: self, action: #selector(handleSearch))
    
        let moreImage = UIImage(named: "nav_more_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .Plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButton]
    }
    
    func handleSearch() {
        print("x")
    }
    func handleMore(){
        print("y")
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! VideoCell
       
        print("video cell: \(cell.titleLabel.window)")

        cell.video = videos[indexPath.item]
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        //calculate aspect image height according to 9/16 ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    // remove spacing between cells
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


