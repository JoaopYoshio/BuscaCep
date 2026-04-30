unit CepInterfaces;

interface

uses
  System.JSON,
  System.SysUtils;

type
  TEndereco = record
    CEP         : string;
    Logradouro  : string;
    Bairro      : string;
    Cidade      : string;
    UF          : string;
    function ToJSON: TJSONObject;
    function Valido: Boolean;
  end;

  EEnderecoNaoEncontrado = class(Exception);

  IEnderecoProvider = interface
    ['{4A8FD1F4-AB60-4846-AD44-CF874DDFA0E2}']
    function BuscarPorCEP(const ACEP: string; out AEndereco: TEndereco): Boolean;
    function RetornaNomeProvider: string;
  end;

implementation

function TEndereco.Valido: Boolean;
begin
  Result := (CEP <> '') and (Logradouro <> '');
end;

function TEndereco.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('cep',        CEP);
  Result.AddPair('logradouro', Logradouro);
  Result.AddPair('bairro',     Bairro);
  Result.AddPair('cidade',     Cidade);
  Result.AddPair('uf',         UF);
end;
end.

