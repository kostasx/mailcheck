fs     = require 'fs'
path   = require "path"
xml2js = require 'xml2js'
say    = require "say"
# walk   = require "walk"
# dir    = require "node-dir"

parser = new xml2js.Parser()

file      = fs.readFileSync "./mailcheck.config", "UTF-8"
mailboxes = JSON.parse(file).mailboxes  # ARRAY
mailDir   = JSON.parse(file).maildir

# RETURNS ARRAY OF FILES AND FOLDERS (NON RECURSIVE)
# TODO: Exclude .DS_Store
maildirs = fs.readdirSync mailDir  

maildirs.forEach ( dir )->
    if ( mailboxes.indexOf(dir) > -1 )
        inboxXML = fs.readFileSync "#{mailDir}/#{dir}/INBOX.mbox/Info.plist", "UTF-8"
        # Parse Info.plist XML
        parser.parseString inboxXML, (err, result)->
            unreadMessages = result.plist.dict[0].integer[0] 
            unreadMessages = parseInt unreadMessages, 10
            if ( unreadMessages > 0 )
                messages = if ( unreadMessages is 1 ) then "μήνυμα" else "μηνύματα"
                say.speak "Nikos", "Καλώς Ήλθατε στο Mailcheck. Έχετε #{unreadMessages} #{messages}" 
