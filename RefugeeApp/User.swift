import Foundation
import Firebase
import FirebaseAuth

class User:NSObject{
    var id:String!
    var email:String!
    var gender:String!
    var firstName:String!
    var lastName:String!
    var dateOfBirth:String!
    var countryOfOrigin:String!
    var profession:String!
    var employee:Bool!
    var verified:Bool!
    var uniqueNumber:Int!
    var dictonary:[String:Any]!

    
    init(user:UserInfo, dictionary:[String:Any]) {
        id = user.uid
        email = user.email
        gender = dictionary["gender"] as! String
        firstName = dictionary["firstName"] as! String
        lastName = dictionary["lastName"] as! String
        dateOfBirth = dictionary["dateOfBirth"] as! String
        countryOfOrigin = dictionary["countryOfOrigin"] as! String
        profession = dictionary["profession"] as! String
        employee = dictionary["employee"] as! Bool
        verified = dictionary["verify"] as! Bool
        if (dictionary["uniqueNumber"] != nil){
            uniqueNumber = dictionary["uniqueNumber"] as! Int
        } else {
            uniqueNumber = 0
        }
    }
    
    init(dictionary:[String:Any]){
        id = nil
        email = nil
        gender = dictionary["gender"] as! String
        firstName = dictionary["firstName"] as! String
        lastName = dictionary["lastName"] as! String
        dateOfBirth = dictionary["dateOfBirth"] as! String
        countryOfOrigin = dictionary["countryOfOrigin"] as! String
        profession = dictionary["profession"] as! String
        employee = dictionary["employee"] as! Bool
        verified = dictionary["verify"] as! Bool
        if (dictionary["uniqueNumber"] != nil){
            uniqueNumber = dictionary["uniqueNumber"] as! Int
        } else {
            uniqueNumber = 0
        }
    }
}
