# This is a module to import if I wanna install Mathematica
# It is required to download the Mathematica install script (rename file from uni to fit description silly) 
# Add it to the nix-store manually using:
# nix-store --query --hash \
# $(nix store add-path Mathematica_XX.X.X_BNDL_LINUX.sh --name 'Mathematica_XX.X.X_BNDL_LINUX.sh')
# Then replace the resulting hash

{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    (mathematica.override {
      source = requireFile {
        name = "Mathematica_14.1.0_BNDL_LINUX.sh";
        sha256 = "03f3805x28wdgnqvqifcz5hnk1i0cphszv1175g91zsfn7v1pjra";
        message = ''
          Your override for Mathematica includes a different src for the installer,
          and it is missing.
        '';
        hashMode = "recursive";
      };
    })
  ];
}
