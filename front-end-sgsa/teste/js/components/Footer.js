export function carregarFooter() {
    fetch('templates/footer.html')
    .then(res =>{
        if(!res.ok){
            throw new Error ('Erro ao encontrar footer')
        }
        return res.text()
    })
    .then(html => {
        const footerCode = document.getElementById('footer')
        if(footerCode){
            footerCode.innerHTML = html
        }
    })
    .catch(err => {
        console.log('fudeu deu erro kkk')
    })
}