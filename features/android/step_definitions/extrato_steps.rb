Dado ('que autentico com um email {string} e senha {string}') do |email, senha|
  logon = ExtratoScreen.new
  logon.touch_btn_entrar_home
  logon.enter_campo_email email
  logon.enter_campo_senha senha
  logon.touch_search_keyboard
  logon.touch_btn_entrar_login
end

Quando('seleciono o extrato') do
  extrato = ExtratoScreen.new
  extrato.touch_btn_extrato
end

E('visualizo saldo disponível') do
  saldo = ExtratoScreen.new
  saldo.touch_aba_saldo_disponivel
  saldo.valor_saldo_disponivel_displayed?
end

Então('visualizo saldo a receber') do
  saldo = ExtratoScreen.new
  saldo.touch_aba_saldo_receber
  saldo.valor_saldo_receber_displayed?
end

Quando('seleciono Filtrar') do
  filtro = ExtratoScreen.new
  filtro.touch_btn_filtrar
end

Então('visualizo a exibição de todos os filtros por tipo e período') do
  filtros = ExtratoScreen.new
  filtros.filtro_entrada_displayed?
  filtros.filtro_saida_displayed?
  filtros.filtro_tudo_displayed?
  filtros.filtro_7_dias_displayed?
  filtros.filtro_15_dias_displayed?
  filtros.filtro_30_dias_displayed?
  filtros.filtro_60_dias_displayed?
  filtros.filtro_90_dias_displayed?
end
