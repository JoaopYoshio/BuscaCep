unit ProviderFallbackTests;

interface

uses
  DUnitX.TestFramework,
  CepProviderFallback,
  CepInterfaces,
  MockFalhaProvider,
  MockSucessoProvider;

type
  [TestFixture]
  TProviderFallbackTests = class
  public
    [Test]
    procedure SucessoComFallback;

    [Test]
    procedure FalhaProviders;

    [Test]
    procedure SucessoProvider;
  end;

implementation

procedure TProviderFallbackTests.SucessoComFallback;
var
  Fallback: TProviderFallback;
  Endereco: TEndereco;
begin
  Fallback := TProviderFallback.Create;
  try
    Fallback.Add(TMockFalhaProvider.Create);
    Fallback.Add(TMockSucessoProvider.Create);

    Assert.IsTrue(Fallback.Executar('01001000', Endereco));
    Assert.AreEqual('Cidade Mock', Endereco.Cidade);

  finally
    Fallback.Free;
  end;
end;

procedure TProviderFallbackTests.FalhaProviders;
var
  Fallback: TProviderFallback;
  Endereco: TEndereco;
begin
  Fallback := TProviderFallback.Create;
  try
    Fallback.Add(TMockFalhaProvider.Create);
    Fallback.Add(TMockFalhaProvider.Create);

    Assert.IsFalse(Fallback.Executar('01001000', Endereco));

  finally
    Fallback.Free;
  end;
end;

procedure TProviderFallbackTests.SucessoProvider;
var
  Fallback: TProviderFallback;
  Endereco: TEndereco;
begin
  Fallback := TProviderFallback.Create;
  try
    Fallback.Add(TMockSucessoProvider.Create);
    Fallback.Add(TMockFalhaProvider.Create);

    Assert.IsTrue(Fallback.Executar('01001000', Endereco));
    Assert.AreEqual('Cidade Mock', Endereco.Cidade);

  finally
    Fallback.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TProviderFallbackTests);

end.

