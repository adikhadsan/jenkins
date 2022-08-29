FROM python:3.8
COPY . ./app
WORKDIR /app
RUN pip install -r requirements.txt
COPY . ./app
EXPOSE 9191
CMD ["python", "app.py"]

