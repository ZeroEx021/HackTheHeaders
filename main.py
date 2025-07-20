import requests
from rich.console import Console
from rich.table import Table

console = Console()

SECURITY_HEADERS = {
    "Strict-Transport-Security": "Protege contra ataques de tipo SSL stripping.",
    "Content-Security-Policy": "Previene ataques XSS y otros ataques de inyección.",
    "X-Frame-Options": "Previene ataques de clickjacking.",
    "X-XSS-Protection": "Activa protección contra ataques XSS en navegadores antiguos.",
    "X-Content-Type-Options": "Evita la interpretación errónea de tipos MIME.",
    "Referrer-Policy": "Controla la cantidad de información enviada en el encabezado Referer.",
    "Permissions-Policy": "Restringe el acceso a APIs del navegador."
}

def analizar_headers(url):
    try:
        response = requests.get(url, timeout=10)
        headers = response.headers

        table = Table(title=f"Cabeceras de Seguridad para {url}")
        table.add_column("Cabecera", style="cyan")
        table.add_column("Presente", style="green")
        table.add_column("Descripción", style="magenta")

        for header, desc in SECURITY_HEADERS.items():
            presente = "✅" if header in headers else "❌"
            table.add_row(header, presente, desc)

        console.print(table)

    except Exception as e:
        console.print(f"[red]Error al analizar {url}: {e}[/red]")

if __name__ == "__main__":
    console.print("[bold yellow]HackTheHeaders - Analizador de Cabeceras HTTP[/bold yellow]")
    objetivo = input("Ingresa una URL (ej. https://example.com): ").strip()
    if not objetivo.startswith("http"):
        objetivo = "https://" + objetivo
    analizar_headers(objetivo)
