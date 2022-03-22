{
  description = ''Simplify Nim Inter-Thread Communication'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-threadproxy-0_2_2.flake = false;
  inputs.src-threadproxy-0_2_2.owner = "jackhftang";
  inputs.src-threadproxy-0_2_2.ref   = "0_2_2";
  inputs.src-threadproxy-0_2_2.repo  = "threadproxy.nim";
  inputs.src-threadproxy-0_2_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-threadproxy-0_2_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-threadproxy-0_2_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}