module Path exposing (join)


join : List String -> String
join urls =
    let
        needsLastTrailingSlash : Bool
        needsLastTrailingSlash =
            urls
                |> List.reverse
                |> List.head
                |> Maybe.withDefault ""
                |> (\string -> string /= "/" && String.endsWith "/" string)
    in
    urls
        |> List.map dropBoth
        |> String.join "/"
        |> (\joinedUrl ->
                if needsLastTrailingSlash then
                    String.append joinedUrl "/"

                else
                    joinedUrl
           )


dropBoth : String -> String
dropBoth url =
    url |> dropLeading |> dropTrailing


dropLeading : String -> String
dropLeading url =
    if String.startsWith "/" url then
        String.dropLeft 1 url

    else
        url


dropTrailing : String -> String
dropTrailing url =
    if String.endsWith "/" url then
        String.dropRight 1 url

    else
        url
