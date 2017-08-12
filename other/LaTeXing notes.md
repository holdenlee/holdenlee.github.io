---
title: LaTeXing notes
published: 2017-08-06
modified: 2017-08-06
tags: under_construction, problem_page
type: uncategorized
showTOC: True
---



(put websites for reference)

#DO
##LiveTeXing

+ Come to class on time. Make sure your computer was already on standby, so you don't have to wait for it to power up when the lesson has started.
+ Use centered equations. Use lists.
+ shortcuts, indexing, etc. theorems, numbering. tables and diagrams. time pressures.

Specific package help

+Nomenclature (list of notation):  [Tutorial](http://www.simonsilk.com/content/simonsilk/2011-jun/latex-list-notations-nomenclature); run makeindex [Tiddlywiki escape formatting is not working. Get the source of the page to view this properly.] {{{
<
filename
>
.nlo -s nomencl.ist -o 
<
filename
>
.nls on the command line.}}}
    +Configuring for TeXWorks automatically:
        1.Go to Edit
>
Preferences
        1.Click the Typesetting tab
        1.Click "+" on the Processing tools pane
        1.Name the tool "Nomenclature" and write miktex-makeindex.exe for Program.
        1.Add the following 5 arguments (on separate lines) $basename.nlo -s nomencl.ist -o $basename.nls

##Content

+ Feel free to reword and reorganize the material for clarity. The aim is to produce a clear set of notes, not an exact transcript of what the professor says.
+ Add other links and references.

##Sharing

+ ''Tell the class (and the professor!) that you're typing up notes.'' (Don't be embarrassed; after all, they're the ones benefiting.) Sometimes the professor may link to your notes. If the professor has partial notes, it's a good idea to ask for the source code to avoid repeating work; be clear about what you intend to do with it.
+ **Ask for people to email typos.** Fix them promptly and give them a hearty thank-you.
+ **Make source code available.** This way, when you're finished, others may build on it -- to annotate with their own notes, or to update it for subsequent years' courses.
+ **Solicit help**: See if anyone else is interested in helping out; if so, split the work.



