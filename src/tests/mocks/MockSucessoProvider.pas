unit MockSucessoProvider;

interface

uses
  CepInterfaces;

type

  TMockSucessoProvider = class(TInterfacedObject, IEnderecoProvider)
  public
    function BuscarPorCEP(const ACEP: string; out AEndereco: TEndereco): Boolean;
    function RetornaNomeProvider: string;
  end;

implementation

uses
  System.SysUtils,
  System.JSON,
  System.Net.HttpClient;

function TMockSucessoProvider.RetornaNomeProvider: string;
begin
  Result := 'SucessoProvider';
end;

function TMockSucessoProvider.BuscarPorCEP(const ACEP: string; out AEndereco: TEndereco): Boolean;
begin
  AEndereco.CEP := ACEP;
  AEndereco.Logradouro := 'Rua Teste';
  AEndereco.Bairro := 'Centro';
  AEndereco.Cidade := 'Cidade Mock';
  AEndereco.UF := 'PR';

  Result := True;
end;

end.
