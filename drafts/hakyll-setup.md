---
title: Setting up Hakyll
subtitle: How I made this blog
published: 2016-02-07
modified: 2016-02-07
tags: haskell, blogging, web design
showTOC: True
inline: True
---

# Setting up Hakyll

1. First install the [Haskell Platform](https://www.haskell.org/downloads) if you haven't already.
2. Next install [Hakyll](https://jaspervdj.be/hakyll/tutorials/01-installation.html) using cabal. Initialize a default Hakyll website (the command below initializes the site in directory "my-site").
    ```
    cabal install hakyll
	hakyll-init my-site
	```
3. Read through the Hakyll tutorials to understand how it works.

On Windows, when trying to run ./site in Cygwin, I got the error [commitBuffer: invalid argument (invalid character)](https://jaspervdj.be/hakyll/tutorials/faq.html). I solved this by running in Windows Powershell.
```bash
chcp 65001
./site build
```

# Site design using Bootstrap.js

In Hakyll, the content of the site is kept separate from the site design. When you write posts, just write in Markdown and optionally specify some metadata like tags and date edited. In site.hs you'll specify how to "wrap" html, etc. around those posts to create the actual pages on the site. Thus, Hakyll is very modular - you can easily change the site layout independently of the content.

I chose a minimal theme (basically just to get the navigation bar). There's much more you can do with Bootstrap; see the page for info.

1. [Get bootstrap](http://getbootstrap.com/getting-started/).
2. Unzip the files into the blog directory. (I unzipped them directly into folders css/, js/, and fonts/, but you can also put them as subdirectories in bootstrap/ if you prefer.)
3. Modify the starter template, and saved it as default.html. The content of the pages will go into `$body$`. Note that I added a footer.

```html
    <!DOCTYPE html>
    <html>
 
 	<head>
 	<meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 
 	<meta name="description" content="Holden Lee's Blog">
 	<meta name="author" content="Holden Lee">
     
 	<title>$title$</title>
 
 	<link href="/css/bootstrap.min.css" rel="stylesheet">
 
 	<link href="/css/blog.css" rel="stylesheet">
 	<link href="/css/default.css" rel="stylesheet">
 	</head>
 
 	<body>
 
 	<!-- Navigation bar. navbar-inverse is black, navbar-default is white.-->
 	<!-- To make a button active (pressed), use <li class="active"> -->
 	<div id="header">
 	<nav class="navbar navbar-inverse navbar-fixed-top">
     <div class="container">
     <div class="navbar-header">
     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
     <span class="sr-only">Toggle navigation</span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     </button>
     <a class="navbar-brand" href="/">Holden's Blog</a>
     </div>
     <div id="navbar" class="collapse navbar-collapse">
     <ul class="nav navbar-nav">
     <li><a href="/">Home</a></li>
     <li><a href="/sitemap.html">Sitemap</a></li>
     <li><a href="/about.html">About</a></li>
 	<!-- TODO: make this part a for loop over main pages -->
     </ul>
     </div>
     </div>
 	</nav>
 	</div>
 
 	$body$
 
 	<!-- Footer -->
 	<div id="footer">
 	<div class="container">
     Built with
     <a href="http://jaspervdj.be/hakyll">Hakyll</a> 
     using 
     <a href="http://www.getbootstrap.com">Bootstrap</a>, 
     <a href="http://www.mathjax.org">MathJax</a>, 
     <a href="http://www.disqus.com">Disqus</a>,
     <a href="http://highlightjs.org/">Highlight.js</a>, and 
     <a href="http://ignorethecode.net/blog/2010/04/20/footnotes/">Footnotes.js</a>
 	</div>
 	</div>
 	</body>
 
 	</html>
 
 	<!-- jQuery-->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
 	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
 
 	<script src="/js/bootstrap.min.js"></script>
```

# Template html files

How do we turn a post written in Markdown into actual webpage? First, we read the metadata (title, subtitle, tags, date) from the Markdown file and display them in a uniform manner. Create the file templates/post.html:

```html
<div class="container">
  <div id="content">
    <div class="page header">
      <h1>$title$</h1>
    </div>
    <div class="info">
      $if(subtitle)$ <div class="subtitle"><p>$subtitle$</p></div> $endif$
      $if(date)$ 
        <p>Posted: $date$ 
          $if(modified)$, Modified: $modified$ $endif$
	</p>
      $endif$
      $if(tags)$ <p>Tags: $tags$</p> $endif$
    </div>
    
  </div>

  <div class="blog-main">
    $body$
  </div>
</div>
```
Every page will be (further) wrapped by default.html which we defined above. Finally, I created stylesheets css/blog.css and css/default.css to specify how I want the headings, subtitles, etc. to look. (Actually, I mostly stole them from other sites.)

I made a pattern to match the top level pages besides the main page. For convenience, I treat them the same way as posts are treated, except that they don't have a subtitle, date, tags, etc. I hardcode their URLs into the navbar (though if you want to, you can loop over them instead and hence not have to change the html if you add new top-level pages).

# Tags and Categories

[Javran's post](http://javran.github.io/posts/2014-03-01-add-tags-to-your-hakyll-blog.html) gives a tutorial on adding tags.

You can make categories the same way that you do tags. The difference is that each page is in only one category, determined by the subfolder that it is in.

I wanted hierarchical categories, which is tricky to do. My code for this is not elegant right now, but it works to give a [sitemap](/sitemap.html).

# LaTeX and MathJax

There are two things we have to do: parse text in between dollar signs as LaTeX, and then render the LaTeX in the actual page using MathJax. I got the following material from [JD Reaver's post](http://jdreaver.com/posts/2014-06-22-math-programming-blog-hakyll.html) and [Travis Athoughies's post](http://travis.athougies.net/posts/2013-08-13-using-math-on-your-hakyll-blog.html).

1. Tell Pandoc to parse text between dollar signs as math:
    ```haskell
	pandocMathCompiler =
		let mathExtensions = [Ext_tex_math_dollars, Ext_tex_math_double_backslash,
			Ext_latex_macros]
			defaultExtensions = writerExtensions defaultHakyllWriterOptions
			newExtensions = foldr S.insert defaultExtensions mathExtensions
			writerOptions = defaultHakyllWriterOptions {
			                  writerReferenceLinks = True,
							  writerHtml5 = True,
							  writerHighlight = True,
							  writerExtensions = newExtensions,
							  writerHTMLMathMethod = MathJax ""
						    }
		in pandocCompilerWith defaultHakyllReaderOptions writerOptions
    ```
1. In order for a web page to render LaTeX, it must link to the MathJax script.
    ```html
	<script type="text/javascript"
        src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
    ```
	Thus, to add MathJax functionality to all pages, add this add the end of default.html.
1. The [MathJax documentation](https://docs.mathjax.org/en/v2.5-latest/tex.html#defining-tex-macros) describes how to add packages and macros (so you can write `\R` for `\mathbb{R}`, for example). To do this, add a configuration file `MathJax/config/local/local.js`. The format is described in the link. Now modify the html code above to link to your configuration file. Note we must give the full, not relative, URL, so we set `siteURL` and add it to the context in site.hs. Then we change the link as follows:
    ```html
	<script type="text/javascript"
        src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML,$siteURL$/MathJax/config/local/local"></script>
	```
1. TODO: script


# Code highlighting

Get [highlight.js](https://highlightjs.org/download/) for all languages you will use, and put it in the folder highlight/ in the blog directory. Include the new css/js files in the pattern matches, and add the following script to default.html, changing the style as you'd like.
```html
<link rel="stylesheet" href="/highlight/styles/tomorrow-night-bright.css">
<script src="/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
```

To highlight code in posts, put name/abbreviation of the language at the start of the code block like this:
```markdown
 ```haskell
    main = putStrLn "Hello World!"
 ```
```

# Footnotes

[Footnotes.js](http://ignorethecode.net/blog/2010/04/20/footnotes/), created by Lukas Mathis, shows the footnote when you hover over the number[^f]. Once you have the js code, the procedure for adding this extension is standard: add a js file and include it in default.html:

1. Put the following into js/footnotes.js.
    ```js
    // this script requires jQuery
    $(document).ready(function() {
        Footnotes.setup();
    });
    
    var Footnotes = {
    	footnotetimeout: false,
        setup: function() {
            var footnotelinks = $("a[rel='footnote']")
            
            footnotelinks.unbind('mouseover',Footnotes.footnoteover);
            footnotelinks.unbind('mouseout',Footnotes.footnoteoout);
            
            footnotelinks.bind('mouseover',Footnotes.footnoteover);
            footnotelinks.bind('mouseout',Footnotes.footnoteoout);
        },
        footnoteover: function() {
            clearTimeout(Footnotes.footnotetimeout);
            $('#footnotediv').stop();
            $('#footnotediv').remove();
            
            var id = $(this).attr('href').substr(1);
            var position = $(this).offset();
        
            var div = $(document.createElement('div'));
            div.attr('id','footnotediv');
            div.bind('mouseover',Footnotes.divover);
            div.bind('mouseout',Footnotes.footnoteoout);
    
            var el = document.getElementById(id);
            div.html($(el).html());
            
            div.css({
                position:'absolute',
                width:'400px',
                opacity:0.9
            });
            $(document.body).append(div);
    
            var left = position.left;
            if(left + 420  > $(window).width() + $(window).scrollLeft())
                left = $(window).width() - 420 + $(window).scrollLeft();
            var top = position.top+20;
            if(top + div.height() > $(window).height() + $(window).scrollTop())
                top = position.top - div.height() - 15;
            div.css({
                left:left,
                top:top
            });
        },
        footnoteoout: function() {
            Footnotes.footnotetimeout = setTimeout(function() {
                $('#footnotediv').animate({
                    opacity: 0
                }, 600, function() {
                    $('#footnotediv').remove();
                });
            },100);
        },
        divover: function() {
            clearTimeout(Footnotes.footnotetimeout);
            $('#footnotediv').stop();
            $('#footnotediv').css({
                    opacity: 0.9
            });
        }
    }
	```
2. Add this line to default.html:
    ```html
    <script src="/js/footnotes.js"></script>
    ```
3. To add footnotes, write `[^f1]` at the location where you want the footnote, and then `[^f1]: footnote text` anytime later.

[^f]: like this!

# Disqus comments

Disqus is an external comment management system that you can embed in your website.

1. Create an account at [Disqus](http://www.disqus.com). Follow the directions to add Disqus to the site.
2. Here is the code to add to post.html. The page URL is the concatenation of `$siteURL$` and `$url$`. 
    ```html
    <div id="disqus_thread"></div>
    <script>
    var disqus_config = function () {
    this.page.url = $siteURL$$url$; // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = $url$; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');

    s.src = '//holdenlee.disqus.com/embed.js';

    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
	```

# Github.io integration

The compiled html files should be kept separate from the uncompiled files, so by default Hakyll puts the compiled site in _site/. However, I don't want the blog to be at `http://holdenlee.github.io/blog/_site/`, and I also want to put the uncompiled files on github. So I create a github repository called `blog`, make 2 branches `gh-pages` (which will be shown at http://holdenlee.github.io/blog) and `hakyll`. I maintain these branches in 2 directories on my computer, and have a script that copies `hakyll/_site/` to `blog` and pushes everything.

In gitup2:
```
#!/bin/bash

git add .
git commit -a -m "$1"
git push origin "$2"
```

In webup:
```bash
#!/bin/bash

cp -TRv hakyll/_site/ blog/
cd hakyll
gitup2 "$1" hakyll
cd ../blog
gitup2 "$1" gh-pages
```

Juan Pedro Villa has a [post](http://www.stackbuilders.com/news/dr-hakyll-crea-una-pagina-de-github-con-hakyll-y-circleci) on how to integrate Hakyll with [CircleCI](http://www.circleci.com), which builds the site automatically every time you push to github (like the support that Github currently has for Jekyll). (I would like to use this, but am currently having trouble with getting the server to compile the Haskell files.)

# Social media buttons

# Additional features

There are many cool features I haven't covered. I would like to add some of these in the future.

* [Auto-generated table of contents for each post]() (cf. Wikipedia)
* [Shortcuts]()
* Analytics
