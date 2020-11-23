# userData
## Formato: {'userName' : {'password' : (password),'subscriptions' : [(usernames)]}
Este dicionário é utilizado para armazenar a informação dos utilizadores, a chave é o nome do utilizador e o valor é um dicionário (previamente convertido em objecto json) que contém a password e as subscrições do respetivo utilizador.

# messageData
## Formato: {'userName' : [(messages)]
Neste dicionário são armazenadas todas as mensagens enviadas pelos utilizadores, com o respetivo timestamp. A chave é o nome do utilizador e o valor é uma lista cujos elementos em indices pares são o timestamp da mensagem que se sucede (estas estão nos indices impares da lista). ex.: [timestamp1, mensagem1, timestamp2, mensagem2]