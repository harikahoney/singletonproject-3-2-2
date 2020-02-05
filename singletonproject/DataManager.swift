//
//  DataManager.swift
//  singletonproject
//
//  Created by Peddisrirachanarachu@gmail.com on 1/31/20.
//  Copyright © 2020 Peddisrirachanarachu@gmail.com. All rights reserved.
//

import UIKit
import Alamofire
//creating a class datamanager
class DataManager: NSObject {
    static var shared = DataManager()
    private override init() {
        super .init()
    }
    //creating a func with parameters albumdata
    func albumData(url:String,completion:@escaping([Album]?,Error?)->Void){
    //By using almofire,connecting to the server and getting data
        
        Alamofire.request(url).responseData{(albumresponse) in
            //checking error, if there is no error we get the data from the server

            if(albumresponse.result.error != nil){
                print(albumresponse.result.error?.localizedDescription)
                completion(nil,albumresponse.result.error)
            }else{
                do{
                    let convertedAlbumData = try JSONDecoder().decode([Album].self, from: albumresponse.result.value!)//converting data to json decoder
                    completion(convertedAlbumData,nil)//calling closures
                    print(convertedAlbumData)
                }catch{
                    print("something went wrong")
                }
            }
            
        }
        
    }
    
    //creating a func with parameters commentdata

    func commentData(url:String,completion:@escaping([Comments]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data

        Alamofire.request(url).responseData{(commentResponse) in
            //checking error, if there is no error we get the data from the server

            if(commentResponse.result.error != nil ){
                print(commentResponse.result.error?.localizedDescription)
                completion(nil,commentResponse.result.error)//calling closures
            }else{
                do{
                    var convertedCommentData = try JSONDecoder().decode([Comments].self, from: commentResponse.result.value!)//converting data to json decoder
                    completion(convertedCommentData,nil)//calling closures
                    
                }catch{
                    print("something went wrong")
                    
                }
            }
            
        }
    }
    
    //creating a func with parameters postdata

    func postData(url:String,completion:@escaping([post]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data

        Alamofire.request(url).responseData{(postResponse) in
            //checking error, if there is no error we get the data from the server

            if(postResponse.result.error != nil){
                
                print(postResponse.result.error?.localizedDescription)
                completion(nil,postResponse.result.error)//calling closures
            }else{
                do{
                    let convertedPostData = try JSONDecoder().decode([post].self, from: postResponse.result.value!)//converting data to json decoder
                    print(convertedPostData)
                    completion(convertedPostData,nil)//calling closures
                }catch{
                    print("something went wrong")
                }
            }
            
        }
    }
    
    //creating a func with parameters todosdata

    func todosData(url:String,completion:@escaping([todos]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data

        Alamofire.request(url).responseData{(todosResponse) in
            //checking error, if there is no error we get the data from the server

            if(todosResponse.result.error != nil){
                print(todosResponse.result.error?.localizedDescription)
                completion(nil,todosResponse.result.error)//calling closures
            }else{
                do{
                    var convertedtodosData = try JSONDecoder().decode([todos].self, from: todosResponse.result.value!)//converting data to json decoder
                    print(convertedtodosData)
                    completion(convertedtodosData,nil)//calling closures
                }catch{
                    print("something went wrong")
                }
            }
        }
    }
    //creating a func with parameters actorsdata

    func actorsData(url:String,parameters:[String:String],completion:@escaping([String]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data and converting to jsonserialization

        Alamofire.request(url,method: .post,parameters:
            parameters).responseJSON{(actorsResponse) in
                
            //checking error, if there is no error we get the data from the server

            if(actorsResponse.result.error != nil){
                print(actorsResponse.result.error?.localizedDescription)
                completion(nil,actorsResponse.result.error)
            }else{
                var convertedActorsData = actorsResponse.result.value! as! [String]
                print(convertedActorsData)
                completion(convertedActorsData,nil)
            }
            
        }
    }
    //creating a func with parameters quotesdata

    func quotesData(url:String,parameters:[String:String],completion:@escaping([String]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data and converting to jsonserialization
    
        Alamofire.request(url,method: .post,parameters:
            parameters).responseJSON{(quotesResponse) in
                //checking error, if there is no error we get the data from the server
     if(quotesResponse.result.error != nil){
                print(quotesResponse.result.error?.localizedDescription)
        completion(nil,quotesResponse.result.error)
            }else{
                var convertedquotesData = quotesResponse.result.value! as!  [String]
                print(convertedquotesData)
        completion(convertedquotesData,nil)
            }
            
        }
    }
    
    //creating a func with parameters photosdata

    func photosData(url:String,completion:@escaping([photos]?,Error?)->Void){
        //By using almofire,connecting to the server and getting data
           Alamofire.request(url).responseData{(photosResponse) in
            //checking error, if there is no error we get the data from the server
             if(photosResponse.result.error != nil){
                   print(photosResponse.result.error?.localizedDescription)
                   completion(nil,photosResponse.result.error)
               }else{
                   do{
                       var convertedphotosData = try JSONDecoder().decode([photos].self, from: photosResponse.result.value!)//converting data to json decoder
                       print(convertedphotosData)
                       completion(convertedphotosData,nil)//calling closures
                   }catch{
                       print("something went wrong")
                   }
               }
           }
    




    

}
}
