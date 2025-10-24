FROM python:3.9-slim

WORKDIR /app 

COPY khalid.py . 

CMD ['python', 'khalid.py']