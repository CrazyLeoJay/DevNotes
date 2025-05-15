# Ktransformers

- [官方网站](https://kvcache-ai.github.io/ktransformers/)
- [GitHub 站点](https://github.com/kvcache-ai/ktransformers)

博客：

- [KTransformers：让显卡轻松驾驭满血DeepSeek的秘籍！](https://blog.csdn.net/drdairen/article/details/145612436)



[清华大学](https://so.csdn.net/so/search?q=清华大学&spm=1001.2101.3001.7020)KVCache.AI团队联合趋境科技精心打造的推理框架。支持在仅有24GB显存的消费级显卡上流畅运行DeepSeek-R1、V3的671B满血版！你没听错，就是671B那个大家伙！



KTransformers，发音为快速变压器，旨在提高您的🤗具有高级内核优化和放置/并行性策略的变压器经验。

KTransformers是一个灵活的，以Python为中心的框架，其核心是可扩展性。通过使用单行代码实现和注入优化的模块，用户可以访问与Transformers兼容的界面，与OpenAI和Ollama兼容的RESTful api，甚至是简化的类似ChatGPT的web UI。

我们对KTransformers的愿景是作为一个灵活的平台，用于试验创新的LLM推理优化。请让我们知道，如果你需要任何其他功能。



## 准备工作



一些准备工作:

- CUDA 12.1及以上，如果你还没有，你可以从这里安装。

  ```
  # Adding CUDA to PATH
  export PATH=/usr/local/cuda/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
  export CUDA_PATH=/usr/local/cuda
  ```

  

- 与gcc，g ++ 和cmce Linux-x86_64

  ```
  sudo apt-get update
  sudo apt-get install gcc g++ cmake ninja-build
  ```

  

- 我们建议使用Conda创建一个带有Python = 3.11的虚拟环境来运行我们的程序。

  ```
  conda create --name ktransformers python=3.11
  conda activate ktransformers # you may need to run ‘conda init’ and reopen shell first
  ```

  

- 确保安装了PyTorch，packaging，ninja

  ```
  pip install torch packaging ninja cpufeature numpy
  ```

  



## 快速开始 

[(github 原文)](https://github.com/kvcache-ai/ktransformers?tab=readme-ov-file#installation)

1. 使用Docker映像，请参阅 [Docker](ktransformers\docker.md) 文档

2. 您可以使用Pypi安装 (适用于linux):

   ```
   pip install ktransformers --no-build-isolation
   ```

   

   对于windows，我们在ktransformers-0.2.0 + cu125torch24avx2-cp312-cp312-win_amd64.whl上准备一个预编译的whl包，它需要cuda-12.5，torch-2.4，python-3.11，更多的预编译包正在生成。

3. 或者你可以下载源代码并编译:

   - init源代码

     ```
     git clone https://github.com/kvcache-ai/ktransformers.git
     cd ktransformers
     git submodule init
     git submodule update
     ```

   - [可选] 如果要与网站一起运行，请在执行bash install.sh之前编译网站

   - 编译和安装 (适用于Linux)

     ```
     bash install.sh
     ```

   - 编译和安装 (适用于Windows)

     ```
     install.bat
     ```

     

4. 如果您是开发人员，则可以使用makefile来编译和格式化代码。makefile的详细用法在这里



## 本地聊天



我们提供了一个简单的命令行本地聊天Python脚本，您可以运行它进行测试。

> 请注意，这是一个非常简单的测试工具，只支持一轮聊天，没有任何关于最后输入的记忆，如果你想尝试模型的全部能力，你可以去RESTful API和Web UI。我们在这里使用DeepSeek-V2-Lite-Chat-GGUF模型作为示例。但是我们也支持其他模型，您可以将其替换为要测试的任何其他模型。

**运行示例**

```sh
# Begin from root of your cloned repo!
# Begin from root of your cloned repo!!
# Begin from root of your cloned repo!!! 

# Download mzwing/DeepSeek-V2-Lite-Chat-GGUF from huggingface
mkdir DeepSeek-V2-Lite-Chat-GGUF
cd DeepSeek-V2-Lite-Chat-GGUF

wget https://huggingface.co/mzwing/DeepSeek-V2-Lite-Chat-GGUF/resolve/main/DeepSeek-V2-Lite-Chat.Q4_K_M.gguf -O DeepSeek-V2-Lite-Chat.Q4_K_M.gguf

cd .. # Move to repo's root dir

# Start local chat
python -m ktransformers.local_chat --model_path deepseek-ai/DeepSeek-V2-Lite-Chat --gguf_path ./DeepSeek-V2-Lite-Chat-GGUF

# If you see “OSError: We couldn't connect to 'https://huggingface.co' to load this file”, try：
# GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/deepseek-ai/DeepSeek-V2-Lite
# python  ktransformers.local_chat --model_path ./DeepSeek-V2-Lite --gguf_path ./DeepSeek-V2-Lite-Chat-GGUF
```



它具有以下参数:

- -- model_path (必选): 模型名称 (如 “deepseek-ai/DeepSeek-V2-Lite-Chat”，会自动从拥抱面下载配置)。或者，如果你已经有了本地文件，你可以直接使用该路径来初始化模型。

  > 注:。目录中不需要safetensors文件。我们只需要配置文件来构建模型和tokenizer。

- -- gguf_path (必需): 包含GGUF文件的目录的路径，可以从拥抱面下载。请注意，该目录应仅包含当前模型的GGUF，这意味着您需要为每个模型一个单独的目录。

- -- optimize_rule_path (Qwen2Moe和DeepSeek-V2除外): 包含优化规则的YAML文件的路径。在ktransformers/optimize/optimize_rules目录中预先编写了两个规则文件，用于优化DeepSeek-V2和Qwen2-57B-A14两个SOTA MoE模型。

- -- max_new_tokens: Int (默认值 = 1000)。要生成的新令牌的最大数量。

- -- cpu_infer: Int (默认值 = 10)。用于推理的cpu数量。理想情况下，应设置为 (内核总数-2)。



请注意，在使用DeepSeek和QWen时，您需要遵守其相应的模型许可证。



## RESTful API和Web UI

开始没有网站:

```
ktransformers --model_path deepseek-ai/DeepSeek-V2-Lite-Chat --gguf_path /path/to/DeepSeek-V2-Lite-Chat-GGUF --port 10002
```

从网站开始:

```
ktransformers --model_path deepseek-ai/DeepSeek-V2-Lite-Chat --gguf_path /path/to/DeepSeek-V2-Lite-Chat-GGUF  --port 10002 --web True
```



或者你想用变压器启动服务器，model_path应该包括safetensors

```
ktransformers --type transformers --model_path /mnt/data/model/Qwen2-0.5B-Instruct --port 10002 --web True
```

使用url访问网站http:// localhost:10002/web/index.html #/chat:![Web UI](ktransformers.assets/615dca9b-a08c-4183-bbd3-ad1362680faf)

关于RESTful API服务器的更多信息可以在这里找到。您还可以在这里找到与Tabby集成的示例。

## 📃简短的注射教程

KTransformers的核心是一个用户友好的、基于模板的注入框架。这使研究人员可以轻松地用优化的变体替换原始的torch模块。它还简化了组合多个优化的过程，允许探索它们的协同效应。

![Inject-Struction](ktransformers.assets/6b4c1e54-9f6d-45c5-a3fc-8fa45e7d257e)

鉴于vLLM已经作为大规模部署优化的一个很好的框架，KTransformers特别关注受有限资源约束的本地部署。我们特别关注异构计算机会，例如量化模型的GPU/CPU卸载。例如，我们分别为CPU和GPU支持高效的Llamafile和Marlin内核。更多细节可以在这里找到。



**使用示例**

要使用提供的内核，用户只需要创建一个基于YAML的注入模板，并在使用Transformers模型之前添加对 “optimize_and_load_gguf” 的调用。

```
with torch.device("meta"):
    model = AutoModelForCausalLM.from_config(config, trust_remote_code=True)
optimize_and_load_gguf(model, optimize_rule_path, gguf_path, config)
...
generated = prefill_and_generate(model, tokenizer, input_tensor.cuda(), max_new_tokens=1000)
```



在该示例中，首先在元设备上初始化自动模型以避免占用任何存储器资源。然后，optimize_and_load_gguf遍历模型的所有子模块，匹配YAML规则文件中指定的规则，并将它们替换为指定的高级模块。

注入后，原始的generate接口可用，但是我们还提供了兼容的prefill_and_generate方法，该方法使像CUDAGraph这样的进一步优化能够提高生成速度。



## 如何自定义您的模型

这里给出了使用DeepSeek-V2作为示例的注入和多GPU的详细教程。

下面是一个YAML模板的示例，用于用高级4位量化内核Marlin替换所有原始线性模块。

```
- match:
    name: "^model\\.layers\\..*$"  # regular expression 
    class: torch.nn.Linear  # only match modules matching name and class simultaneously
  replace:
    class: ktransformers.operators.linear.KTransformerLinear  # optimized Kernel on quantized data types
    device: "cpu"   # which devices to load this module when initializing
    kwargs:
      generate_device: "cuda"
      generate_linear_type: "QuantizedLinearMarlin"
```



YAML文件中的每个规则都有两个部分: 匹配和替换。匹配部分指定应该替换哪个模块，替换部分指定要与初始化关键字一起注入到模型中的模块。

您可以在ktransformers/optimize/optimize_rules目录中找到用于优化DeepSeek-V2和Qwen2-57B-A14 (两个SOTA MoE模型) 的示例规则模板。这些模板用于支持local_chat.py演示。

如果您对我们的设计原理和注入框架的实现感兴趣，请参阅设计文档 [design document](https://github.com/kvcache-ai/ktransformers/blob/main/doc/en/deepseek-v2-injection.md).。