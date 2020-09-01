//
//  Models.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/09/01.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import Foundation

// 予想: 型を定義できる??
public enum UserPostType {
    
    case photo, video
    
}

enum Gender {
    case mail, femail, other
}

struct User {
    
    let username: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
    
}

struct UserCount {
    
    let following: Int
    let follwers: Int
    let posts: Int
    
}

/// Represent user post
public struct UserPost {
    
    let postType: UserPostType
    let thumbnailImgege: URL
    let caption: String?
    let likeCount: [PostLikes]
    let comments: [PostComment]
    let createdDate: Date
    let tabbedUsers: [String]
    
}

struct PostLikes {
    
    let username: String
    let postIdentifier: String
    
}

struct PostComment {
    
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLikes]
    
}

struct CommentLikes {
    
    let username: String
    let commentIdentifier: String
}
