module PathTests exposing (suite)

import Expect
import Path
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "generated xml"
        [ test "empty list" <|
            \() ->
                Path.join []
                    |> Expect.equal ""
        , test "single url" <|
            \() ->
                Path.join [ "https://example.com" ]
                    |> Expect.equal "https://example.com"
        , test "append relative url" <|
            \() ->
                Path.join [ "https://example.com", "about" ]
                    |> Expect.equal "https://example.com/about"
        , test "append absolute url to base with trailing slash" <|
            \() ->
                Path.join [ "https://example.com/", "/about" ]
                    |> Expect.equal "https://example.com/about"
        , test "append absolute url to base" <|
            \() ->
                Path.join [ "https://example.com", "/about" ]
                    |> Expect.equal "https://example.com/about"
        , test "append absolute url with trailing slash to base" <|
            \() ->
                Path.join [ "https://example.com", "/about/" ]
                    |> Expect.equal "https://example.com/about/"
        ]
