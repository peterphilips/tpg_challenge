FROM jupyter/pyspark-notebook:latest

# Set the working directory
WORKDIR /app/

# Copy the PySpark code into the container
COPY task_attempt.ipynb .
COPY requirements.txt .


# Install any required libraries

RUN pip install --no-cache-dir -r requirements.txt

# expose port
EXPOSE 8888

# Start the application using spark-submit
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
# CMD ["/bin/bash", "-c", "spark-submit --master local[*] task_attempt.ipynb"]

# would then run in terminal: docker build -t my_spark_app .
# docker run -p 8888:8888 myapp