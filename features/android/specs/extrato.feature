# language: pt

Funcionalidade: Extrato
   
  @android @extrato @ton @saldo
  Cenário: Validar exibição dos saldos disponível e a receber no extrato
    Dado que autentico com um email "#####" e senha "#####"
    Quando seleciono o extrato
    E visualizo saldo disponível
    Então visualizo saldo a receber

  @android @extrato @ton @filtros
  Cenário: Validar exibição de todos os filtros por tipo e período
    Dado que autentico com um email "wfix_pereira@hotmail.com" e senha "sarah12345"
    Quando seleciono o extrato
    E seleciono Filtrar
    Então visualizo a exibição de todos os filtros por tipo e período