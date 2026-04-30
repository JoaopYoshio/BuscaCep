unit MockFalhaProvider;

interface

uses
  CepInterfaces;

type

  TMockFalhaProvider = class(TInterfacedObject, IEnderecoProvider)
  public
    function BuscarPorCEP(const ACEP: string; out AEndereco: TEndereco): Boolean;
    function RetornaNomeProvider: string;
  end;
implementation

function TMockFalhaProvider.RetornaNomeProvider: string;
begin
  Result := 'FalhaProvider';
end;

function TMockFalhaProvider.BuscarPorCEP(const ACEP: string; out AEndereco: TEndereco): Boolean;
begin
  Result := False;
end;
end.
