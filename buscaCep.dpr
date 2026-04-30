program buscaCep;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  CepController,
  CepProviderFallback,
  CepInterfaces,
  CepService,
  ViaCepProvider,
  OpenCepProvider,
  AwesomeAPIProvider;

begin
  try
    Writeln('Iniciando servidor...');

    CepController.RegisterRoutes;

    THorse.Listen(9000);

    Readln;

  except
    on E: Exception do
      Writeln(E.Message);
  end;
end.
