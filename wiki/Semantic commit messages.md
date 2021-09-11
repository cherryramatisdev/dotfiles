# Como pequenas mudanças e padrões podem tornar a code base e a comunicação do time muito melhor usando mensagens padronizadas semanticamente para os commits.
> Referência original caso haja duvidas: https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716

```
Format: <type>(<scope>): <subject>
```

## Onde:
`<type>`  é uma keyword especial que vai ser explicada abaixo
`<scope>`  é opcional e pode ser usado para delimitar qual parte do código foi alterada(ex: `feat(create product): clean up service implementation`)
`<subject>`  é uma mensagem breve do que foi finalizado no commit

## Types possiveis:
- `feat`: nova feature para o usuário final, não uma nova feature para script de build.
- `fix`: bug fix para o usuário final, não uma fix para script de build.
- `docs`: mudanças na documentação(engloba storybook no caso do frontend).
- `style`: mudanças de formatação, correções de warning do eslint, etc; sem mudança no codigo de produção.
- `refactor`: refactor em código de produção, ex: renomear uma variável ou classe.
- `test`: mudanças em arquivo de testes, sejam elas adicionar assertions, refatorar e etc, sem mudança no codigo de produção.
- `chore`: mudanças em helper functions, configs, scripts de build, etc.

