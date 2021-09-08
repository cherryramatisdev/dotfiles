# Solving Card TEC-7
To solve this card, I'll need to require category creation before
``` typescript
const categoryFound = await this.categoryRepository.findOne({ where: { id: categoryId }})

if(!categoryFound) throw new BadRequestException('Category must be created before')

const created = await this.repository.insert({ ...productBody, cate    gories: [categoryFound] })
```
