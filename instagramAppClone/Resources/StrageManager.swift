//
//  StrageManager.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/28.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerErorr: Error {
        
        case failedToDownload
        
    }
    
    // 予想: 型を定義できる??
    public enum UserPostType {
        
        case photo, video
        
    }
    
    /// Represent user post
    public struct UserPost {
        
        let postType: UserPostType
        let thumbnailImgege: URL
        let caption: String?
        let likeCount: [PostLikes]
        let comments: [PostComment]
        let createdDate: Date
        
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
    
    //MARK:- public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerErorr>) -> Void) {
        
        bucket.child(reference).downloadURL { (url, error) in
            
            guard let url = url, error == nil else {
                
                completion(.failure(.failedToDownload))
                
                return
                
            }
            
            completion(.success(url))
            
        }
        
        
    }
    
}
