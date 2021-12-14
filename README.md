If you changed it, compile site.hs.

    ghc --make -threaded site.hs

After updating pages, 

    ./site rebuild

Start the server by

	./site watch

# Instructions for self

Open Ubuntu.

	cd Documents/web/web-source
	stack exec site rebuild