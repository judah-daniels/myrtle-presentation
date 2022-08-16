{ pkgs ? import ./nixpkgs.nix {}
, sources ? import ./sources.nix
}:

with pkgs;

let revealjs = sources.revealjs;
in
{ name
, src
# Theme is one of:
# beige, black, blood, league, moon, night,
# serif, simple, sky, solarized, white
, theme ? "white"
}: stdenv.mkDerivation {
  inherit src;
  name = "${name}-slides";

  buildInputs = [
    pandoc
    revealjs
  ];

  buildPhase = ''
    # Add custom stylesheet
    cat <<EOF > style.css
    img {
      border: none !important;
      box-shadow: none !important;
    }
    EOF

    pandoc -t revealjs \
      -V theme=${theme} \
      --standalone \
      --css ./style.css \
      --slide-level=2 \
      --output ./index.html \
      ${name}.md
  '';

  installPhase = ''
    mkdir -p $out
    cp * $out/
    cp -r ${revealjs} $out/reveal.js
  '';
}
