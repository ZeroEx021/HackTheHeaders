# 🔐 HackTheHeaders

**HackTheHeaders** es una herramienta educativa desarrollada en Python para analizar las cabeceras de seguridad HTTP de un sitio web. Útil para aprender sobre hardening de aplicaciones web y auditorías pasivas sin realizar ningún tipo de intrusión.

## 🚀 Características

- Analiza las cabeceras HTTP más importantes en términos de seguridad.
- Ofrece una breve explicación de cada cabecera.
- Informa si la cabecera está presente o ausente.
- Presenta los resultados en una tabla colorida usando Rich.
- 100% legal y educativo – no realiza ninguna acción ofensiva.

## 🧠 ¿Por qué usar esta herramienta?

La configuración adecuada de cabeceras HTTP es fundamental para proteger aplicaciones web frente a ataques como:

- Cross-Site Scripting (XSS)
- Clickjacking
- Sniffing de contenido
- SSL Stripping

**HackTheHeaders** te permite auditar un sitio web de forma pasiva para ver qué tan bien están implementadas esas defensas.

## ⚙️ Instalación

```bash
git clone https://github.com/FBLAKER/HackTheHeaders.git
cd HackTheHeaders
pip install -r requirements.txt
