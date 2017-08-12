--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, TupleSections #-}
--http://julien.jhome.fr/posts/2013-05-14-adding-toc-to-posts.html
module TableOfContents where
import           Data.Monoid
import qualified Data.Set as S
import           Hakyll
import           Text.Pandoc.Options
import           Control.Monad
import           Data.List

compileTOCVersion = version "toc" $
   compile $ pandocCompilerWith defaultHakyllReaderOptions
                                defaultHakyllWriterOptions {
                                    writerTableOfContents = True
                                  , writerTemplate = Just "$if(toc)$ $toc$ $endif$"
                                  -- , writerStandalone = True
                                  }

blankTOCCtx :: Context String
blankTOCCtx = constField "toc" ""

tocCtx :: Context String
tocCtx = field "toc" $ \item ->
            loadBody ((itemIdentifier item) { identifierVersion = Just "toc"})
