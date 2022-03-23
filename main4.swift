import Foundation
//import UIKit

struct Date{
    var hour = 1
    var day = 1
    var month = 1
    var year = 1900

    var string: String{
        var ret = "\(self.day).\(self.month).\(self.year)"
        return ret
    }

    func timeDif(_ date2: Date) -> String{
        if self.year != date2.year{
            var ret = "\(abs(self.year - date2.year)) years ago"
            return ret
        }
        if self.month != date2.month{
            var ret = "\(abs(self.month - date2.month)) months ago"
            return ret
        }
        if self.day != date2.day{
            var ret = "\(abs(self.day - date2.day)) days ago"
            return ret
        }
        if self.hour != date2.hour{
            var ret = "\(abs(self.hour - date2.hour)) hours ago"
            return ret
        }
        return ""
    }
}

enum Flairs{
    case spoiler
    case ending
    case fanart
    case other
}

enum Media{
    case pic
    case video
    case link
    case text
}

class SubReddit{
    var Name: String
    //var ProfilePic: UIImage?
    var Description: String
    var Posts: [Post] = []
    var Followers: [RedditProfile] = []

    public init(_ name: String, _ description: String){
        self.Name = name
        self.Description = description
    }

    func addPost(_ post: Post){
        self.Posts.append(post)
    }

    public func addFollower(_ profile: RedditProfile){
        self.Followers.append(profile)
    }

    var string: String{
        var ret = "r/\(self.Name) - \(self.Description)\nPosts: \(self.Posts.count) | Followers: \(self.Followers.count)\n"
        return ret
    }
}

class RedditProfile{
        var Name: String
        var CreateDay: Date
        var Karma: Int = 0
        //var ProfilePic: UIImage?
        var Following: [SubReddit] = []
        var Posts: [Post] = []

    public init(_ name: String, _ date: Date) {
        self.Name = name
        self.CreateDay = date
    }

    public func karmaUp(){
        self.Karma = self.Karma+1
    }

    func followSubReddit(_ sub: SubReddit){
        self.Following.append(sub)
        sub.addFollower(self)
    }

    func addPost(_ post: Post){
        self.Posts.append(post)
    }

    var string: String{
        var ret = "u/\(self.Name)\nCake Day: \(self.CreateDay.string)\nKarma: \(Karma)\nPosts: \(self.Posts.count)\n"
        return ret
    }
}

class Post{
    var Title: String
    var Text: String
    var Addition: Media
    var Time: Date
    var Flair: Flairs
    var Author: RedditProfile
    var UpVotes: Int = 0
    var DownVotes: Int = 0

    public init(_ title: String, _ text: String, _ author: RedditProfile, _ media: Media, _ time: Date, _ flair: Flairs) {
        self.Title = title
        self.Text = text
        self.Time = time
        self.Flair = flair
        self.Author = author
        self.Addition = media
    }

    func voteUp(){
        self.UpVotes = self.UpVotes + 1
        self.Author.karmaUp()
    }    
    func voteDown(){
        self.DownVotes = self.DownVotes + 1
    }

    var string: String{
        var up: String
        var down: String
        if self.UpVotes>1000{
            up = "\((self.UpVotes/100)%1000/10)k"
        }
        else{
            up = "\(self.UpVotes)"
        }
        if self.DownVotes>1000{
            down = "\(self.DownVotes/1000)k"
        }
        else{
            down = "\(self.DownVotes)"
        }
        var ret = "posted by u/\(self.Author.Name) \(self.Time.timeDif(Date(hour: 22, day: 30, month: 3, year: 2021))) [\(self.Addition)]\n+\(up) / -\(down)\n[\(self.Flair)]\n \(self.Title)\n   \(self.Text)\n"
        return ret
    }
}

// Test data
var mySubReddit = SubReddit("snk", "snk/aot fandom")
var myProfile = RedditProfile("Trawirr", Date())
var myPost1 = Post("Last episode", "imo 10/10", myProfile, Media.pic, Date(hour: 10, day: 30, month: 3, year: 2021), Flairs.spoiler)
mySubReddit.addPost(myPost1)
myProfile.addPost(myPost1)
var myPost2 = Post("Ending theory", "it's all just a dream and they gonna simply wake up", myProfile, Media.text, Date(hour: 15, day: 27, month: 3, year: 2021), Flairs.ending)
mySubReddit.addPost(myPost2)
myProfile.addPost(myPost2)
myProfile.followSubReddit(mySubReddit)

myPost1.voteUp()
myPost1.voteUp()
myPost2.voteUp()
myPost2.voteDown()
myPost2.voteDown()
myPost2.voteDown()

for i in 1...2000{
    myPost1.voteUp()
}

// Display in console
print(mySubReddit.string)
print(myProfile.string)
print(myPost1.string)
print(myPost2.string)