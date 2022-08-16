{ mkSlides ? import ../nix/mkSlides.nix {}
}:

mkSlides {
  name = "introduction";
  src = ./slides;
}
