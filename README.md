# BigModel Hub

## Overview

This project enhances the functionality of the ModelScope CLI tool, optimizing the experience of downloading new models from Hugging Face Hub and ModelScope Hub, as well as querying, updating, and removing downloaded models.

## Model Storage

By default, BigModel Hub leverages the caching mechanisms of Hugging Face Hub or ModelScope Hub to store models, ensuring maximum compatibility and storage efficiency.

To modify the default cache directory location, refer to the documentation of Hugging Face Hub or ModelScope Hub and set the environment variables `HF_HUB_CACHE` or `MODELSCOPE_CACHE` accordingly.

If you prefer not to rely on the caching mechanisms of Hugging Face Hub or ModelScope Hub, manually specify a local model storage directory and adhere to the following structure:

```
|- <Local Model Storage Directory>
   |- <Organization ID>
      |- <Model ID>
      |- ...
   |- ...
```

Example of a local model storage directory structure:

```
|- <Local Model Storage Directory>
   |- Qwen
      |- Qwen2.5-7B-Instruct
         |- config.json
         |- ...
```

## Installation

### Local Installation

```bash
pip install bigmodel-hub
```

Test the availability of the BigModel Hub CLI:

```bash
bmhub --help
```

If accessing Hugging Face is hard, set the `HF_ENDPOINT` environment variable:

```bash
HF_ENDPOINT=https://hf-mirror.com bmhub --help
```

### Docker Installation

This project provides an official Docker image with all CLI functionalities identical to the local installation.

Pull the Docker image:

```bash
docker pull yansh97/bigmodel-hub
```

Test the availability of the BigModel Hub CLI:

```bash
docker run --rm yansh97/bigmodel-hub --help
```

If accessing Hugging Face is hard, set the `HF_ENDPOINT` environment variable:

```bash
docker run --rm -e HF_ENDPOINT=https://hf-mirror.com yansh97/bigmodel-hub --help
```

To use Hugging Face Hub's caching mechanism, mount its cache directory into the container:

```bash
docker run --rm -v ~/.cache/huggingface:/root/.cache/huggingface yansh97/bigmodel-hub --help
```

To use ModelScope Hub's caching mechanism, mount its cache directory into the container:

```bash
docker run --rm -v ~/.cache/modelscope:/root/.cache/modelscope yansh97/bigmodel-hub --help
```

To use a local model storage directory, mount it into the container:

```bash
docker run --rm -v <host-local-dir>:<container-local-dir> yansh97/bigmodel-hub --help
```

## CLI Features

[CLI Documentation](CLI.md)

### List Models

List downloaded models, filtered by model ID glob patterns, and view storage usage details.

By default, searches within Hugging Face Hub or ModelScope Hub cache directories. Use `--local-dir` to specify a custom local model storage directory.

```bash
bmhub list --help
```

[CLI Documentation](CLI.md#bmhub-list)

### Download Models

Download a model by the model ID. If the model already exists, it will be updated.

By default, models are downloaded to Hugging Face Hub or ModelScope Hub cache directories. Use `--local-dir` to specify a custom local storage directory

```bash
bmhub download --help
```

[CLI Documentation](CLI.md#bmhub-download)

### Update Models

Update downloaded models, filtered by model ID glob patterns.

By default, updates models in Hugging Face Hub or ModelScope Hub cache directories. Use `--local-dir` to specify a custom local storage directory.

```bash
bmhub update --help
```

[CLI Documentation](CLI.md#bmhub-update)

### Remove Models

Delete downloaded models, filtered by model ID glob patterns.

By default, removes models from Hugging Face Hub or ModelScope Hub cache directories. Use `--local-dir` to specify a custom local storage directory.

```bash
bmhub remove --help
```

[CLI Documentation](CLI.md#bmhub-remove)
