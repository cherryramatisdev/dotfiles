# Lami Way para retornar variaveis de ambiente em projetos *next.js*

Para resolver essa situação, primeiro precisamos checar as opções que temos para tentar:

1. Recuperar dados usando `getStaticProps`
> Isso não é possivel em nossa arquitetura atual pois `getStaticProps` só é permitido dentro de paginas `pages/*.ts`, e hoje nós usamos templates para externalizar o layout de paginas, portanto seriamos obrigados a passar props por diversos componentes ou criarmos uma estrutura com context api apenas para armazenar variaveis, o que não é viável.
2. Prefixar variaveis com `NEXT_PUBLIC_*`
> Esse approach funciona, mas precisamos lidar com muito cuidado quando vamos utilizar isso, no caso das credenciais para o cloudinary não é seguro pois são informações privadas e o `NEXT_PUBLIC` exporta para o javascript client-side acessar.
3. Retornar dados usando rota interna
> Essa é a forma que escolhemos seguir por padrão, essencialmente vamos criar uma rota interna do front na pasta `pages/api` para rodar em server side a retornar os dados do process.env
> No lado do componente, podemos usar o `useSWR` para recuperar esses dados e manipula-los livremente em qualquer localidade do codigo

**pages/api/cloudinary.ts**
```typescript
export default function handler(req, res) {
  res.status(200).json({
     cloudName: process.env.CLOUD_NAME,
	 apiKey: process.env.API_KEY,
	 apiSecret: process.env.API_SECRET,
	 presetName: process.env.PRESET_NAME
  })
}
```

**component/Prescription/index.tsx**
```tsx
export const Prescription: React.FC = () => {
  const fetcher = axiosFactory();
  const { data, error } = useSWR('prod.lamimed.it/api/cloudinary', fetcher.get.bind(fetcher));
  
  if (error) console.error(error)
  
  return (
    <div>
	  {data?.cloudName}
	  {data?.apiKey}
	  {data?.apiSecret}
	  {data?.presetName}
	</div>
  )
}
```

