{ stdenv, fetchzip, findlib, jbuilder, ocaml, configurator, cppo, lablgtk }:
stdenv.mkDerivation rec {
  name = "camlimages-${version}";
  version = "5.0.0";
  src = fetchzip {
    url = "https://bitbucket.org/camlspotter/camlimages/get/${version}.tar.gz";
    sha256 = "00qvwxkfnhv93yi1iq7vy3p5lxyi9xigxcq464s4ii6bmp32d998";
  };
  buildInputs = [ findlib jbuilder ocaml configurator cppo lablgtk ];
  buildPhase = "jbuilder build -p camlimages";
  inherit (jbuilder) installPhase;
  
  meta = with stdenv.lib; {
    branch = "5.0";
    homepage = https://bitbucket.org/camlspotter/camlimages;
    description = "OCaml image processing library";
    license = licenses.gpl2;
    maintainers = [ maintainers.vbgl maintainers maintainers.mt-caret ];
  };
}
