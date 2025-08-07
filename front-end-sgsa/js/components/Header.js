// Componente de cabeçalho reutilizável
export function carregarHeader() {
    fetch('templates/header.html')
    .then(res => {
        if(!res.ok){
            throw new Error('Erro ao encontrar o header!')
        }
        return res.text()
    })
    .then(html => {
        const headerCode = document.getElementById('header')
        if(headerCode){
            headerCode.innerHTML = html;
        }
    })
    .catch(err => {
        console.log('erro!!!')
    })
}