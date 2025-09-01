%{
  configs: [
    %{
      name: "default",
      checks: [
        # Desativa a verificação de documentação de módulo
        {Credo.Check.Readability.ModuleDoc, false}
      ]
    }
  ]
}

