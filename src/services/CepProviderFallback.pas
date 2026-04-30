unit CepProviderFallback;

interface

uses
  System.Generics.Collections,
  CepInterfaces;

type

  TProviderFallback = class
  private
    FProviders: TList<IEnderecoProvider>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(AProvider: IEnderecoProvider);
    function Executar(const ACEP: string; out AEndereco: TEndereco): Boolean;
  end;

implementation

uses
  System.SysUtils;

constructor TProviderFallback.Create;
begin
  inherited;
  FProviders := TList<IEnderecoProvider>.Create;
end;

destructor TProviderFallback.Destroy;
begin
  FProviders.Free;
  inherited;
end;

procedure TProviderFallback.Add(AProvider: IEnderecoProvider);
begin
  FProviders.Add(AProvider);
end;

function TProviderFallback.Executar(const ACEP: string; out AEndereco: TEndereco): Boolean;
var
  Provider: IEnderecoProvider;
begin
  Result := False;

  for Provider in FProviders do
  begin
    try
      Writeln(Format('Tentando provider %s...', [Provider.RetornaNomeProvider]));

      if Provider.BuscarPorCEP(ACEP, AEndereco) and AEndereco.Valido then
      begin
        Writeln('Sucesso.');
        Exit(True);
      end;

      Writeln('Provider nao retornou dados validos, tentando proximo...');
    except
      on E: Exception do
        Writeln(Format('Provider falhou (%s), tentando proximo...', [E.Message]));
    end;
  end;
end;
end.
