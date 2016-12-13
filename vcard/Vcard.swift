//
//  Vcard.swift
//  vcard
//
//  Created by Benjamin Dumont on 12/12/2016.
//  Copyright © 2016 bccompany. All rights reserved.
//

import Foundation

class VCard {
    
    //BEGIN:VCARD
    //VERSION:4.0
    //FN:Stéphane Bortzmeyer
    //N:Bortzmeyer;Stéphane;;;
    //UID:urn:uuid:a06340f8-9aca-41b8-bf7a-094cbb33d57e
    //GENDER:M
    //KIND:individual
    //EMAIL:stephane+blog@bortzmeyer.org
    //TITLE:Indigène de l'Internet
    //PHOTO:http://www.bortzmeyer.org/images/moi.jpg
    //LANG;PREF=1:fr
    //LANG;PREF=2:en
    //IMPP;PREF=1:xmpp:bortzmeyer@dns-oarc.net
    //IMPP;PREF=2:xmpp:bortzmeyer@gmail.com
    //URL:http://www.bortzmeyer.org/
    //KEY:http://www.bortzmeyer.org/files/pgp-key.asc
    //END:VCARD
    
    private var n : String?
    private var fn : String?
    private var nickname : String?
    private var photo : String?
    private var bday : String?
    private var adr : String?
    private var label : String?
    private var tel : String?
    private var email : String?
    private var mailer : String?
    private var geo : String?
    private var title : String?
    private var role : String?
    private var logo : String?
    private var org : String?
    private var categories : String?
    private var note : String?
    private var rev : String?
    private var sortString : String?
    private var sound : String?
    private var url : String?
    private var uid : String?
    private var version : String = "3.0"
    private var key : String?
    
    
    init(user: User) {
        n = user.lastname ?? ""
        n! += ";"
        n! += user.firstname ?? ""
        
        fn = user.firstname ?? ""
        fn! += " "
        fn! += user.lastname ?? ""
        
        if user.phone != nil && !((user.phone?.isEmpty)!) {
            tel = user.phone
        }
        adr = ";;;"
        adr! += (user.address ?? "")
        adr! += ";"
        adr! += (user.zip ?? "")
        adr! += ";"
        adr! += (user.city ?? "")
        adr! += ";"
        adr! += (user.country ?? "")
        
        if let company = user.company {
            org = company
        }
        
        if let mail = user.email {
            email = mail
        }
        if user.title != nil {
            title = user.title
        }
    }
    
    
    func isValid() -> Bool {
        return (n != nil && fn != nil)
    }
    
    func generateVcard() -> String? {
        guard isValid() else {
            return nil
        }
        var vcard = "BEGIN:VCARD"
        vcard.appendReturnCarriage()
        vcard += "VERSION:" + version
        vcard.appendReturnCarriage()
        if let n = n {
            vcard += "N:" + n
            vcard.appendReturnCarriage()
        }
        if let fn = fn {
            vcard += "FN:" + fn
            vcard.appendReturnCarriage()
        }
        if let nickname = nickname {
            vcard += "NICKNAME:" + nickname
            vcard.appendReturnCarriage()
        }
        if let photo = photo {
            vcard += "PHOTO:" + photo
            vcard.appendReturnCarriage()
        }
        if let bday = bday {
            vcard += "BDAY:" + bday
            vcard.appendReturnCarriage()
        }
        if let adr = adr {
            vcard += "ADR;TYPE=WORK:" + adr
            vcard.appendReturnCarriage()
        }
        if let label = label {
            vcard += "LABEL:" + label
            vcard.appendReturnCarriage()
        }
        if let tel = tel {
            vcard += "TEL;TYPE=WORK:" + tel
            vcard.appendReturnCarriage()
        }
        if let email = email {
            vcard += "EMAIL;TYPE+WORK:" + email
            vcard.appendReturnCarriage()
        }
        if let mailer = mailer {
            vcard += "MAILER:" + mailer
            vcard.appendReturnCarriage()
        }
        if let geo = geo {
            vcard += "GEO:" + geo
            vcard.appendReturnCarriage()
        }
        if let title = title {
            vcard += "TITLE:" + title
            vcard.appendReturnCarriage()
        }
        if let role = role {
            vcard += "ROLE:" + role
            vcard.appendReturnCarriage()
        }
        if let logo = logo {
            vcard += "LOGO:" + logo
            vcard.appendReturnCarriage()
        }
        if let org = org {
            vcard += "ORG:" + org
            vcard.appendReturnCarriage()
        }
        if let categories = categories {
            vcard += "CATEGORIES:" + categories
            vcard.appendReturnCarriage()
        }
        if let note = note {
            vcard += "NOTE:" + note
            vcard.appendReturnCarriage()
        }
        if let rev = rev {
            vcard += "REV:" + rev
            vcard.appendReturnCarriage()
        }
        if let sortString = sortString{
            vcard += "SORT-STRING:" + sortString
            vcard.appendReturnCarriage()
        }
        if let sound = sound {
            vcard += "SOUND:" + sound
            vcard.appendReturnCarriage()
        }
        if let url = url {
            vcard += "URL:" + url
            vcard.appendReturnCarriage()
        }
        if let uid = uid {
            vcard += "UID:" + uid
            vcard.appendReturnCarriage()
        }
        if let key = key {
            vcard += "KEY:" + key
            vcard.appendReturnCarriage()
        }
        vcard += "END:VCARD"
        
        return vcard
    }
}


