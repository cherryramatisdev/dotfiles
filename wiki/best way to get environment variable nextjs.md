# Started
Loading Environment Variables
Next.js has built-in support for loading environment variables from *.env.local* into process.env.

An example *.env.local*:

```
DB_HOST=localhost
DB_USER=myuser
DB_PASS=mypassword
```

# 1.
The basic option here is to use `getStaticProps`  to get environment variable and return as props to the component

> This need to be used on a page inside *pages/index.js*
```typescript
export async function getStaticProps() {
  return {
    props: {
     cloudName: process.env.CLOUD_NAME,
	 apiKey: process.env.API_KEY,
	 apiSecret: process.env.API_SECRET,
	 presetName: process.env.PRESET_NAME
    }
  }
}
```

# 2.

This solution is using api feature from next to load stuff on server side, the idea is to create an api route to return those environment variable and get them using *swr*

> pages/api/cloudinary.ts
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

> component/Prescription/index.tsx
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