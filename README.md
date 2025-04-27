# `elm-sitemap`

A simple interface for building a String of an XML sitemap from structured elm
data, following the [sitemap protocol](https://www.sitemaps.org/protocol.html).

_Note_: this package was built as utility for
[`elm-pages`](https://github.com/dillonkearns/elm-pages) apps, and it may be
become more coupled to `elm-pages` over time.

_Note_: this package is forked from dillonkearns/elm-sitemap, and resolves
following issues original one has:
[https://github.com/dillonkearns/elm-sitemap/issues/6](https://github.com/dillonkearns/elm-sitemap/issues/6)

hahnah/elm-sitemap handle trailsing slashes in URLs as is provided. This is
important in some cases for being referenced by Google Search Console and being
indexed by Google Search.

## Example

Here's an example from an `elm-pages` app.

```elm
import Metadata exposing (Metadata(..)) -- this is the user's metadata custom type
import Pages
import Pages.PagePath as PagePath exposing (PagePath)
import Sitemap

build :
    { siteUrl : String
    }
    ->
        List
            { path : PagePath Pages.PathKey
            , frontmatter : Metadata
            , body : String
            }
    ->
        { path : List String
        , content : String
        }
build config siteMetadata =
    { path = [ "sitemap.xml" ]
    , content =
        Sitemap.build config
            (siteMetadata
                |> List.map
                    (\page ->
                        { path = PagePath.toString page.path
                        , lastMod = Nothing }
                    )
            )
    }
```
