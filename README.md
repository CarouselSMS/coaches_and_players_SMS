Coaches and Players SMS
=======================

Application uses the [CarouselSMS messaging API](http://carouselsms.com/#documentation) for sending SMS messages from coaches to players and receiving replies.

It takes advantage of our tagging system, for pairing outgoing numbers from a pool with recipients, and maintaining a link between the two via tags.

Usage
=====

1. Clone the repository.
2. Replace `[API KEY GOES HERE]` in <i>demo.rb</i> with your [CarouselSMS](http://carouselsms.com/) application's API key
2. Run `ruby demo.rb`.
3. Open `http://YOURHOST.COM:4567` in browser.
4. In order to test replies specify `http://YOURHOST.COM:4567/gateway` as the <b>Gateway URL</b> for your [CarouselSMS](http://carouselsms.com/) application.

License
=======

Coaches and Players SMS is Copyright © 2013 [Recess Mobile](http://recess.im/).

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
