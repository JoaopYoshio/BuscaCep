unit CepController;

interface

procedure RegisterRoutes;

implementation

uses
  Horse,
  System.SysUtils,
  System.JSON,
  CepService,
  CepInterfaces;

procedure RegisterRoutes;
begin
  THorse.Get('/cep/:cep',
    procedure(Req: THorseRequest; Res: THorseResponse)
    var
      Service  : TEnderecoService;
      Endereco : TEndereco;
      JSON     : TJSONObject;
    begin
      Service := TEnderecoService.Create;
      try
        try
          Endereco := Service.BuscarPorCEP(Req.Params['cep']);
          Res.ContentType('application/json; charset=utf-8')
            .Send(Endereco.ToJSON.ToString);
        except
          on E: EEnderecoNaoEncontrado do
          begin
            JSON := TJSONObject.Create;
            try
              JSON.AddPair('error', E.Message);

              Res.Status(404)
                .ContentType('application/json; charset=utf-8')
                .Send(JSON.ToString);
            finally
              JSON.Free;
            end;
          end;
          on E: Exception do
          begin
            JSON := TJSONObject.Create;
            try
              JSON.AddPair('error', E.Message);

              Res.Status(500)
                .ContentType('application/json; charset=utf-8')
                .Send(JSON.ToString);
            finally
              JSON.Free;
            end;
          end;
        end;
      finally
        Service.Free;
      end;
    end
  );
end;

end.
