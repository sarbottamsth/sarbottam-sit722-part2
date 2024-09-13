# Dockerfile for book_catalog microservice
# Specifying the image as Python 3.11 version
FROM python:3.11-alpine  

# Setting the workdirectory in the container
WORKDIR /app/

# Getting the requirements.txt into the container work directory
COPY book_catalog/requirements.txt .

# Command to run the python packages installations as specified in the file
RUN pip install --no-cache-dir -r requirements.txt

# Getting all the python files from the book catalog folder
COPY /book_catalog .

# Setting command to run uvicorn as specified on requirements.txt on port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

