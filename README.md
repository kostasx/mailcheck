**mailcheck**: Utility to check for new messages in mailboxes and use Speech synthesis (in Greek) to inform user.

( **WARNING:** Experimental. Still under development )

### REQUIREMENTS

+ Mac OS X 
+ ["Nikos" Greek voice](http://osxdaily.com/2011/07/25/how-to-add-new-voices-to-mac-os-x/) (other languages can be used of course)

### USAGE 

Setup mailcheck.config

```
$ coffee mailcheck.coffee
```

### UNDER THE HOOD

SEARCHES IN ```/Users/{ USERNAME }/Library/Mail/V2/``` FOR ```INBOX.mbox/``` AND THEN PARSES ```Info.plist```

### TODO

* Check at regular intervals
* Read and filter messages based on rules and sender names
* Translate speakable text in multiple languages