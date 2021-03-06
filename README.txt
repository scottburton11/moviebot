= MovieBot

http://wiki.github.com/scottburton11/moviebot

== DESCRIPTION:

MovieBot is a wrapper for MEncoder, ffmpeg and Apple Compressor. 

It provides simple command-line usage, remote control via Starling queue, 
and directory crawling suitable for cron jobs and directory watchers.

== FEATURES/PROBLEMS:


== SYNOPSIS:

    Regular Usage:
    movie_bot /path/to/input.mov -o /path/to/output.mov
    
    In regular mode, you specify the input and output files.
    
    Queue Mode:
    movie_bot -q host:port:queue_name -o /path/to/output/
    
    In queue mode, you specify the Memcache queue and name you want
    to watch, and an output directory for files.
    
    Crawl Mode:
    movie_bot /path/to/input -c -o /path/to/output
    
    In crawl mode, you specify a directory to crawl and an output
    directory for files.

== REQUIREMENTS:

ImageMagick
Mplayer/Mencoder

== INSTALL:

git clone git@github.com:scottburton11/moviebot.git 

== LICENSE:

(The MIT License)

Copyright (c) 2008 Scott Burton

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
