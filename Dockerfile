FROM nvcr.io/nvidia/pytorch:21.07-py3
WORKDIR /workplace
COPY . .
RUN rm -rf /opt/conda/lib/python3.8/site-packages/cv2 && \
    pip install -U pip && \
    pip install . && \
    rm -rf ./*

COPY apis apis

EXPOSE 8123
CMD ["uvicorn", "apis.interface:app", "--host", "0.0.0.0", "--port", "8123"]