# Ktransformers 使用Docker部署

> 原文：https://github.com/kvcache-ai/ktransformers/blob/main/doc/en/Docker.md



## 先决条件



- Docker必须在您的系统上安装并运行。
- 创建一个文件夹来存储大模型和中间文件 (例如/mnt/models)

## 图像



我们的项目有一个Docker映像，您可以通过以下方式提取docker映像:

```sh
docker pull approachingai/ktransformers:0.1.1
```



注意: 在此图像中，我们在AVX512 instuction cpu中编译ktransformers，如果您的cpu不支持AVX512，建议在容器内的/workspace/ktransformers目录中重新编译并安装ktransformer。

## 在本地构建docker映像



- 在那里下载Dockerfile

- 完成，执行

  ```sh
  docker build  -t approachingai/ktransformers:v0.1.1 .
  ```

  

## 用法



假设你有nvidie-container-toolkit，你可以在Docker容器中使用GPU。

```shell
docker run --gpus all -v /path/to/models:/models -p 10002:10002 approachingai/ktransformers:v0.1.1 --port 10002 --gguf_path /models/path/to/gguf_path --model_path /models/path/to/model_path --web True
```



您可以在自述文件中看到更多运算符