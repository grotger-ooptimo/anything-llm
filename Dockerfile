version: '3.8'
services:
  anythingllm:
    image: mintplexlabs/anythingllm
    container_name: anythingllm
    ports:
    - "3008:3008"
    cap_add:
      - SYS_ADMIN
    environment:
    # Adjust for your environment
      - STORAGE_DIR=/app/server/storage
      - JWT_SECRET=""
      - LLM_PROVIDER=ollama
      - OLLAMA_BASE_PATH=http://51.159.164.22:11434
      - OLLAMA_MODEL_PREF=llama2
      - OLLAMA_MODEL_TOKEN_LIMIT=4096
      - EMBEDDING_ENGINE=ollama
      - EMBEDDING_BASE_PATH=http://127.0.0.1:11434
      - EMBEDDING_MODEL_PREF=nomic-embed-text:latest
      - EMBEDDING_MODEL_MAX_CHUNK_LENGTH=8192
      - VECTOR_DB=lancedb
      - WHISPER_PROVIDER=local
      - TTS_PROVIDER=native
      - PASSWORDMINCHAR=8
      # Add any other keys here for services or settings
      # you can find in the docker/.env.example file
    volumes:
      - anythingllm_storage: /etc/easypanel/projects/imagin/llm_fontend_imagin/storage
    restart: always

volumes:
  anythingllm_storage:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /etc/easypanel/projects/imagin/llm_fontend_imagin/storage
