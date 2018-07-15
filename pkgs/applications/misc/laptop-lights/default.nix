{ stdenv, fetchFromGitHub, rustPlatform}:

let
  pname = "laptop-lights";
in

rustPlatform.buildRustPackage rec {
  name = "${pname}-${version}";
  version = "2018.07.15";

  src = fetchFromGitHub {
    owner  = "rembo10";
    repo   = pname;
    rev    = "b6fee75a9aaf785fd456718c7e97e42e4000d93e";
    sha256 = "1pzq87swa3w2jqnfrl0p3wrxz0s17q1q12fc5yajib2asf7jm31r";
  };

  cargoSha256 = "1gm5xywr7dh551n5jrssk1ffxa87bshwv66cnfixkpkx5a5dzj56";

  meta = with stdenv.lib; {
    description = "A little als backlight daemon for laptops ";
    homepage    = https://github.com/rembo10/laptop-lights;
    license     = licenses.gpl3;
    maintainers = with maintainers; [ rembo10 ];
    platforms   = platforms.linux;
  };
}
