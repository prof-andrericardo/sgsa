// main.js – responsável pelo roteamento e carregamento dinâmico

import { carregarHeader } from "./components/Header.js"
import { carregarFooter } from "./components/Footer.js"

window.addEventListener('DOMContentLoaded', () => {
  carregarHeader()
  carregarFooter()
  iniciarTimer()
})

window.addEventListener('hashchange', router)

window.addEventListener("load", router)
window.addEventListener("hashchange", router)

function router() {
  const hash = location.hash || "#/";
  const rota = hash.split("/")[1];

  switch (rota) {
    case "":
    case "home":
      console.log("🏠 Página inicial carregada");
      break;
    case "aulas":
      console.log("📘 Página de Aulas");
      break;
    case "tarefas":
      console.log("📝 Página de Tarefas");
      break;
    case "sair":
      console.log("🚪 Encerrando sessão...");
      break;
    default:
      document.querySelector("main section").innerHTML = `
        <h2>Página não encontrada</h2>
        <p>A rota <code>#/${rota}</code> não existe.</p>
      `;
  }
}

let intervalo = null;
let tempo = 20;

function iniciarTimer() {
  const timerEl = document.getElementById('timer');
  tempo = 20;
  timerEl.textContent = tempo;

  clearInterval(intervalo);
  intervalo = setInterval(() => {
    tempo--;
    timerEl.textContent = tempo;

    if (tempo <= 0) {
      clearInterval(intervalo);
      timerEl.textContent = '0';
      document.getElementById('btn-enviar').classList.remove('btn-secondary');
      document.getElementById('btn-enviar').classList.add('btn-primary');
    }
  }, 1000);
}

function reiniciarTimer() {
  if (tempo === 0) {
    iniciarTimer();
    document.getElementById('btn-enviar').classList.remove('btn-primary');
    document.getElementById('btn-enviar').classList.add('btn-secondary');
  }
}
