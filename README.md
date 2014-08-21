Sort Dumb Photos
========

My camera phone creates filenames like 0610131205.jpg, where the
digits represent mmddyytttt. Well, that's dumb. The years are in the
middle? It makes it extremely hard to sort them into folders. See also
http://xkcd.com/1179/

So this script sorts them into folders for me.

Usage: ./sort_dumb_photos.pl

Run it in a directory with a bunch of jpgs and it will create
a subdirectory for each year and move the jpgs appropriately. I
wouldn't try it when there are jpgs that don't have numeric mmddyy...
filenames.
