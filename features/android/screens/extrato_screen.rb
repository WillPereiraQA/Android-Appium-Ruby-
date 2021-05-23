class ExtratoScreen < BaseScreen
  
  #logon
  identificator(:btn_entrar_home) { [:uiautomator, 'new UiSelector().text("Entrar")'] }
  identificator(:campo_email) { [:class, 'android.widget.EditText', 0] }
  identificator(:campo_senha) { [:class, 'android.widget.EditText', 1] }
  identificator(:btn_entrar_login) { [:class, 'android.widget.TextView', 10] }
  identificator(:btn_entrar_login) { [:class, 'android.widget.TextView', 10] }
  
  #Saldo
  identificator(:btn_ocultar_saldo) { [:class, 'android.view.ViewGroup', 7] }
  identificator(:btn_extrato) { [:uiautomator, 'new UiSelector().text("Ver extrato")'] }
  identificator(:aba_saldo_disponivel) { [:uiautomator, 'new UiSelector().text("Saldo disponível")'] }
  identificator(:aba_saldo_receber) { [:uiautomator, 'new UiSelector().text("Saldo a receber")'] }
  identificator(:valor_saldo_disponivel) { [:class, 'android.widget.TextView', 3] }
  identificator(:valor_saldo_receber) { [:class, 'android.widget.TextView', 3] }
  
  #Filtros
  identificator(:btn_filtrar) { [:class, 'android.widget.TextView', 5] }
  identificator(:filtro_entrada) { [:class, 'android.widget.TextView', 12] }
  identificator(:filtro_saida) { [:class, 'android.widget.TextView', 13] }
  identificator(:filtro_tudo) { [:class, 'android.widget.TextView', 14] }
  identificator(:filtro_7_dias) { [:class, 'android.widget.TextView', 16] }
  identificator(:filtro_15_dias) { [:class, 'android.widget.TextView', 18] }
  identificator(:filtro_30_dias) { [:class, 'android.widget.TextView', 19] }
  identificator(:filtro_60_dias) { [:class, 'android.widget.TextView', 20] }
  identificator(:filtro_90_dias) { [:class, 'android.widget.TextView', 21] }
  identificator(:btn_fechar) { [:class, 'android.view.ViewGroup', 33] }
    
end
 
