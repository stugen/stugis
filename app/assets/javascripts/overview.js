$(window).on('load', () => {
    $('.stugen-container.collapse').on('show.bs.collapse', (event) => event.target.parentNode.classList.add('open'))
    $('.stugen-container.collapse').on('hide.bs.collapse', (event) => event.target.parentNode.classList.remove('open'))
})
