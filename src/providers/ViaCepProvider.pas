unit ViaCepProvider;

interface

uses
  CepInterfaces;

type
  TViaCepProvider = class(TInterfacedObject, IEnderecoProvider)
  private
    const BASE_URL = 'https://viacep.com.br/ws/%s/json/';
  public
    function BuscarPorCEP(const ACep: string; out AEndereco: TEndereco): Boolean;
    function RetornaNomeProvider: string;
  end;

implementation

uses
  System.SysUtils,
  System.JSON,
  System.Net.HttpClient;

function TViaCepProvider.RetornaNomeProvider: string;
begin
  Result := 'ViaCEP';
end;

function TViaCepProvider.BuscarPorCEP(const ACep: string; out AEndereco: TEndereco): Boolean;
var
  Client  : THTTPClient;
  Response: IHTTPResponse;
  JSON    : TJSONObject;
  Resp    : string;
begin
  Result := False;

  Client := THTTPClient.Create;
  try
    Client.ConnectionTimeout := 5000;
    Client.ResponseTimeout   := 5000;

    Response := Client.Get(Format(BASE_URL, [ACep]));
    Resp     := Response.ContentAsString;

    JSON := TJSONObject.ParseJSONValue(Resp) as TJSONObject;
    try
      if not Assigned(JSON) then
        Exit;

      if JSON.GetValue<Boolean>('erro', False) then
        Exit;

      AEndereco.CEP        := JSON.GetValue<string>('cep',        '');
      AEndereco.Logradouro := JSON.GetValue<string>('logradouro', '');
      AEndereco.Bairro     := JSON.GetValue<string>('bairro',     '');
      AEndereco.Cidade     := JSON.GetValue<string>('localidade', '');
      AEndereco.UF         := JSON.GetValue<string>('uf',         '');

      Result := AEndereco.Valido;
    finally
      JSON.Free;
    end;

  finally
    Client.Free;
  end;
end;

end.
