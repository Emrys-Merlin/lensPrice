LensPrice
==========

This script was written to automate the lookup of dslr lens prices. It
config.rb you can specify a 'guenstiger.de' link of a lens (or
actually any other item) you want to keep track of. The script should
be run regularly by a cron job or something comparable. It will log
all prices and can notify you via e-mail if it has noticed any price
drops. For the e-mail part to work, you will need some sort of mail
server.

There are still some bugs in there, especially the error handling if a
site moved is pretty bad (i.e. non-existent), so handle with care. You
have been warned.
