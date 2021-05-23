# Testes Automatizados Android #

## Como o projeto está estruturado: ##
***
```
TON/
├── config
│   ├── app
│   ├── monkeypatch
│   ├── cucumber.yml
│   └── selenium_hub
├── features
│   ├── android
│   │   ├── screens
│   │   ├── specs
│   │   └── step_definitions
│   │
│   └── support
│       ├── caps
│       │   └── android.txt
│       │   
│       ├── env.rb
│       ├── helpers
│       └── hooks.rb
└── screenshots
│   └── android
│    
└── reports
    
```
## Escrita dos cenários ##
Escrevi dois cenários, validando o Extrato.
Um cenário valida a exibição dos saldos e o outro cenário valida que todos os filtros estão sendo exibidos com sucesso.
Os cenários foram escritos no formato <BDD>

## Linguagens de programação utilizadas ##
Ruby, Gherkin

### Frameworks e Ferramentas ###
Cucumber, Appium, Selenium, Android Studio

### Divisão de features ###
Dividi o app em features, ou funcionalidades, sendo uma delas a <Extrato>. 
As features são subdivididas em cenários específicos.

### Apontando cenários com tags ###
Para facilitar a execução de um determinado cenário isoladamente, sem a necessidade de executar todo o arquivo da feature, marquei marquei cada um com uma tag específica, exemplo: @saldo 

### Steps / Classes / Métodos / Elementos ###
- Cada step do cenário escrito em <BDD> possui um step definition convertido em gherkin, que se comunica com os métodos;
- Cada elemento do front do app foi adicionado no arquivo de screens;
- Conforme o projeto vai aumentando o número de features e cenários, mais screens devem ser criadas de acordo com as funcionalidades;
- Além dos elementos, a screen contém métodos que respodem aos step definitions;
- Para métodos que podem ser utilizados para diversas features e cenários, foi criada a <Base Screen>, que contém métodos robustos e gerais, com a possibilidade de cobrirem uma inifinidade de steps. A idéia é todas as screens responderem à Base Screen, podendo assim se alimentarem dos métodos.

## Gerar Relatorio em HTML ###

 - É possível gerar relatórios do Cucumber em HTML, salvos na pasta 'reports', basta adicionar "-p android-report" na linha do comando de execução dos cenários. Ex:
 
 ```
 bundle exec cucumber -p android -t @saldo features/android/specs/extrato.feature -p android-report

 ```
   