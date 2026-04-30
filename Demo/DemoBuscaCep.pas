unit DemoBuscaCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EditCep: TEdit;
    MemoBairro: TMemo;
    MemoCidade: TMemo;
    MemoUF: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MemoCep: TMemo;
    MemoLogradouro: TMemo;
    NetHTTPClient1: TNetHTTPClient;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Response: IHTTPResponse;
  JSONObj: TJSONObject;
  URL: string;
begin
  try
    // URL da sua API local (ajuste se necessário)
    URL := 'http://localhost:9000/cep/' + EditCep.Text;

    Response := NetHTTPClient1.Get(URL);

    if Response.StatusCode = 200 then
    begin
      JSONObj := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      try
        if Assigned(JSONObj) then
        begin
          MemoCep.Text := JSONObj.GetValue<string>('cep');
          MemoLogradouro.Text := JSONObj.GetValue<string>('logradouro');
          MemoBairro.Text := JSONObj.GetValue<string>('bairro');
          MemoCidade.Text := JSONObj.GetValue<string>('cidade');
          MemoUF.Text := JSONObj.GetValue<string>('uf');
        end;
      finally
        JSONObj.Free;
      end;
    end
    else
      ShowMessage('Erro: ' + Response.StatusText);

  except
    on E: Exception do
      ShowMessage('Erro ao consumir API: ' + E.Message);
  end;
end;

end.
