//
//  VideoCell.swift
//  DosTube
//
//  Created by Mahmoud Eldesouky on 7/4/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

// MARK - VideoCell
class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var video: Video? {
        didSet{
            titleLabel.text = video?.title
            
            thumbnailImageView.image = UIImage(named: (video?.thumbnailImageName)!)
            
            if let profileImageName = video?.channel?.profilePictureName {
                userProfileImage.image = UIImage(named: profileImageName)
            }
            
            if let channelName = video?.channel?.name, numberOfViews = video?.numberOfViews {
                
                let numberFormatter = NSNumberFormatter()
                numberFormatter.numberStyle = .DecimalStyle
                
                let subtitleText = "\(channelName) • \(numberFormatter.stringFromNumber(numberOfViews)!) • 2 years ago "
                subtitleLabel.text = subtitleText
            }
            
            //measure label height
            if let textlabel = video?.title {
                let size = CGSizeMake(frame.width - 16 - 44 - 8 - 16, 1000)
                let options = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
                let estimatedTextSize = NSString(string: textlabel).boundingRectWithSize(size, options: options, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
                print(estimatedTextSize.height)
                if estimatedTextSize.size.height > 20 {
                    labelHeightConstraint?.constant = 44
                }
                else {
                    labelHeightConstraint?.constant = 20
                }
            }
        }
    }
  
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22 // half of frame size: 44
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false // to allow applying constrains in setupViews()
        label.numberOfLines = 2
        return label
    }()
    let subtitleLabel: UITextView = {
        let label = UITextView()
        label.textColor = UIColor.lightGrayColor()
        label.text = "TaylorSwiftVEVO - 1,609,905,898 views • 3 years ago"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        return label
    }()
    
    let separatorView: UIView = {
        let separator = UIView()
        //light color separtor
        separator.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return separator
    }()
    
    var labelHeightConstraint : NSLayoutConstraint?
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(userProfileImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(separatorView)
        
        // Horizontal Constraints
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImage)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        // Veritcal Constraints
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView, userProfileImage, separatorView)
        
        // Top Constraint
        // titleLabel.top = thumbnailImageView.bottom + 8
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 2))
        
        // Left Constraint
        // titleLabel.Leading = userProfileImage.Trailing + 8
        addConstraint( NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImage, attribute: .Right, multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImage, attribute: .Right, multiplier: 1, constant: 8))
        
        // Right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        
        // Height Constraint
        labelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20)
        addConstraint(labelHeightConstraint!)
            
        addConstraint(NSLayoutConstraint(item: subtitleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 30))
        
    }
}
