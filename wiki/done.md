- [x] Adicionar Next link no CallToAction (templates/product)
- [x] Adicionar nome da localidade de fallback como um constants exportado
- [x] Adicionar uma propriedade "icone" para ser retornada como categoria no frontend
- [x] adicionar fotos definitivas em 3 produtos do test_covid para teste @website
- [x] consumir meta tag no frontend @website
- [x] montar a url do tuotempo nos produtos @website
- [x] adicionar short_descriptions nos cards de categoria @website
- [x] adicionar price_label nos produtos @website
- [x] listar localidades em ordem alfabetica @exams
- [x] Terminar de cadastrar produtos da categoria **medici**, so consegui cadastrar medico generale
- [x] Cadastrar produtos da categoria **Infermieri**
- [x] Nao consegui cadastrar produto **Medico Generale** em telemedicina pois falta slug na tabela de Meta
- [x] Incluir no BD uma propriedade em produto para indicar se o preco eh fixo ou um range para decidirmos se vamos usar "A partire de" e o preco direto
> Vamos adicionar no BD um campo price_label nullable que pode ser "A partire de" ou null
- [x] Cadastrar produto "ecografia" em diagnostica assim que harri ou gui sanar a duvida
- [x] revisar hook do tuotempo
	- [x] Adicionar um if especifico para telemedicina removendo areaid *ou usando areaid de telemedicina*
	- [x] Adicionar mais dois para whitelist (sc1615d807ac386a, sc16149d78b9dd7c)
	
- [x] Na pagina de categoria para telemedicina, fazer request com location areaid de telemedicina

- [x] Criar campo `priority` numerico na tabela de categoria e produto
	- [x] Fazer order by com esse campo `priority` nas rotas de listagens
