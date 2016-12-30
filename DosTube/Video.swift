//
//  Video.swift
//  DosTube
//
//  Created by Mahmoud Eldesouky on 7/7/16.
//  Copyright © 2016 Mahmoud Eldesouky. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var subTitle: String?
    var numberOfViews: Int?
    var uploadedAt: NSDate?
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profilePictureName: String?
}