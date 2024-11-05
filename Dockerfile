# Použijte oficiální Python image jako základ
FROM python:3.9-slim

# Nastavte pracovní adresář v kontejneru
WORKDIR /app

# Zkopírujte soubor requirements.txt do pracovního adresáře
COPY requirements.txt .

# Nainstalujte závislosti
RUN pip install --no-cache-dir -r requirements.txt

# Zkopírujte zbytek aplikace do pracovního adresáře
COPY . .

# Nastavte proměnnou prostředí pro Flask
ENV FLASK_APP=app.py

# Otevřete port 5000 pro Flask
EXPOSE 5000

# Spusťte aplikaci
CMD ["flask", "run", "--host=0.0.0.0"]