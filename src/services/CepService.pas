unit CepService;

interface

uses
  CepInterfaces,
  CepProviderFallback,
  System.RegularExpressions;

type
  TEnderecoService = class
  private
    FFallback: TProviderFallback;
  public
    constructor Create;
    destructor Destroy; override;
    function BuscarPorCEP(const ACEP: string): TEndereco;
  end;

implementation

uses
  System.SysUtils,
  ViaCepProvider,
  OpenCepProvider,
  AwesomeAPIProvider;

constructor TEnderecoService.Create;
begin
  inherited;
  FFallback := TProviderFallback.Create;

  FFallback.Add(TViaCepProvider.Create);
  FFallback.Add(TOpenCepProvider.Create);
  FFallback.Add(TAwesomeAPIProvider.Create);
end;

destructor TEnderecoService.Destroy;
begin
  FFallback.Free;
  inherited;
end;

function TEnderecoService.BuscarPorCEP(const ACEP: string): TEndereco;
var
  CEPLimpo: string;
begin
  CEPLimpo := ACEP.Replace('-', '').Trim;

  if not TRegEx.IsMatch(CEPLimpo, '^\d{8}$') then
    raise EEnderecoNaoEncontrado.Create('CEP invalido: ' + ACEP);

  if not FFallback.Executar(CEPLimpo, Result) then
    raise EEnderecoNaoEncontrado.CreateFmt('CEP %s nao encontrado em nenhum provider.', [ACEP]);
end;

end.
