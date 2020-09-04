LensPrice
==========

This script was written to automate the lookup of dslr lens prices. In
config.rb you can specify a 'guenstiger.de' link of a lens (or
actually any other item) you want to keep track of. The script should
be run regularly by a cron job or something comparable. It will log
all prices and can notify you via e-mail if it has noticed any price
drops. For the e-mail part to work, you will need some sort of mail
server.

The error handling is still pretty rough, so handle with care.
