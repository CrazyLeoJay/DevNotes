# Deepseek 下载安装

## 模型仓库

https://huggingface.co/deepseek-ai/DeepSeek-R1

- [huggingface 官网](https://huggingface.co/)

- [Hugging Face官方镜像站（hf-mirror.com） hf-mirror 镜像仓库](https://hf-mirror.com/)
- [DeepSeek-R1 模型仓库](https://huggingface.co/deepseek-ai/DeepSeek-R1)
- [DeepSeek-R1 模型镜像仓库](https://hf-mirror.com/deepseek-ai/DeepSeek-R1)
-  使用阿里巴巴的模搭社区（ModelScope） [modelscope.cn](https://modelscope.cn/)。
- 使用Gitee AI [ai.gitee.com](https://ai.gitee.com/)。
-  [aifasthub.com](https://aifasthub.com/)。

### Git获取

```shell
git clone https://huggingface.co/deepseek-ai/DeepSeek-R1
```

### 镜像

```sh
git clone https://hf-mirror.com/deepseek-ai/DeepSeek-R1
```



## 使用Ollama

https://ollama.com/

安装后，使用命令下载：

> 默认下载 7B

```sh
ollama run deepseek-r1
```



**DeepSeek-R1-Distill-Qwen-1.5B**

```
ollama run deepseek-r1:1.5b
```

**DeepSeek-R1-Distill-Qwen-7B**

```
ollama run deepseek-r1:7b
```

**DeepSeek-R1-Distill-Llama-8B**

```
ollama run deepseek-r1:8b
```

**DeepSeek-R1-Distill-Qwen-14B**

```
ollama run deepseek-r1:14b
```

**DeepSeek-R1-Distill-Qwen-32B**

```
ollama run deepseek-r1:32b
```

**DeepSeek-R1-Distill-Llama-70B**

```
ollama run deepseek-r1:70b
```

完全体

```sh
ollama run deepseek-r1:671b
```





### Model library 可下载的模型

> https://github.com/ollama/ollama/tree/main?tab=readme-ov-file#model-library

Ollama supports a list of models available on [ollama.com/library](https://ollama.com/library 'ollama model library')

Here are some example models that can be downloaded:

| Model              | Parameters | Size  | Download                         |
| ------------------ | ---------- | ----- | -------------------------------- |
| DeepSeek-R1        | 7B         | 4.7GB | `ollama run deepseek-r1`         |
| DeepSeek-R1        | 671B       | 404GB | `ollama run deepseek-r1:671b`    |
| Llama 3.3          | 70B        | 43GB  | `ollama run llama3.3`            |
| Llama 3.2          | 3B         | 2.0GB | `ollama run llama3.2`            |
| Llama 3.2          | 1B         | 1.3GB | `ollama run llama3.2:1b`         |
| Llama 3.2 Vision   | 11B        | 7.9GB | `ollama run llama3.2-vision`     |
| Llama 3.2 Vision   | 90B        | 55GB  | `ollama run llama3.2-vision:90b` |
| Llama 3.1          | 8B         | 4.7GB | `ollama run llama3.1`            |
| Llama 3.1          | 405B       | 231GB | `ollama run llama3.1:405b`       |
| Phi 4              | 14B        | 9.1GB | `ollama run phi4`                |
| Phi 3 Mini         | 3.8B       | 2.3GB | `ollama run phi3`                |
| Gemma 2            | 2B         | 1.6GB | `ollama run gemma2:2b`           |
| Gemma 2            | 9B         | 5.5GB | `ollama run gemma2`              |
| Gemma 2            | 27B        | 16GB  | `ollama run gemma2:27b`          |
| Mistral            | 7B         | 4.1GB | `ollama run mistral`             |
| Moondream 2        | 1.4B       | 829MB | `ollama run moondream`           |
| Neural Chat        | 7B         | 4.1GB | `ollama run neural-chat`         |
| Starling           | 7B         | 4.1GB | `ollama run starling-lm`         |
| Code Llama         | 7B         | 3.8GB | `ollama run codellama`           |
| Llama 2 Uncensored | 7B         | 3.8GB | `ollama run llama2-uncensored`   |
| LLaVA              | 7B         | 4.5GB | `ollama run llava`               |
| Solar              | 10.7B      | 6.1GB | `ollama run solar`               |





## Anything LLM 大语言模型执行工具

https://anythingllm.com/