# Dockerfile (for Trainer)
# FROM python:3.9-slim
FROM tensorflow/tensorflow:2.8.0

ENV PYTHONUNBUFFERED=1
ENV CLIENT_PORT 65430
ENV PATH_APP /app
WORKDIR $PATH_APP

# Defaults, Environment Variables can be overwritten while starting the container with '-e'
ENV SERVER_IP 0.0.0.0
ENV SERVER_PORT 55555

ENV T_EPOCHS 30
ENV T_BATCH_SIZE 16
ENV T_THRESHOLD 0.1
ENV T_SPLIT 10
ENV T_LEARNING_RATE 0.0005
ENV T_LR_DECAY 0.98
ENV T_LAYERS_EXPONENT 4
ENV T_DATASET 2

COPY . .

RUN pip install --no-cache-dir -r _requirements.txt

CMD [ "python", "./worker_training.py" ]