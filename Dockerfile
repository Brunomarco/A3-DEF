
FROM python:3.9 AS development
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

FROM python:3.9-slim AS production
WORKDIR /app
COPY --from=development /app /app
CMD [ 'python', 'app.py' ]

