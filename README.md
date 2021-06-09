# <img src="https://i.imgur.com/23A3S2G.png" width="40"/> Busca CEP 
### Projeto está em desenvolvimento.
<img src="https://i.imgur.com/5b9RHij.jpg" width="800"/>

## API Utilizadas no projeto
Essas API foram escolhidas por serem Open-source
<br>https://viacep.com.br/
<br>https://nominatim.org/

## Busca CEP
Utilizei a API ViaCEP para realizar pesquisa do CEP e retorna os dados de endereco no aplicativo, para marca no mapa as coordenadas do CEP utilizei a API Nominatim que me retorna as coordenadas (latitude e longitude) de um endereço.
<br>Conhecido que alguns CEP a API Nominatim ainda não se encontra atualizada devidamente e pode gerar uma marcação incorreta no mapa, solução seria utilizar API do Google para maior precisão das informações.



## <b>Bugs para corrigir</b>
Apagar marcação do GPS após segunda pesquisa consecutiva
<br>Apagar marcação do mapa após clicar botão Limpar
<br>Definir posição default do mapa após limpar os campos
