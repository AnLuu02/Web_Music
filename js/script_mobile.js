// show main nav left
document.querySelector('.navMobile').addEventListener('click', () => {
    document.querySelector('.container .main_left').classList.add('active');
    if (document.querySelector('.update_profile').classList.contains('active')) {
        document.querySelector('.update_profile').classList.remove('active');

    }
    $('#blur').css('display', 'block');
    $('#blur').click(function() {
        document.querySelector('.container .main_left').classList.remove('active');
        $('#blur').css('display', 'none');

    });
})
document.querySelector('.close_nav_left').addEventListener('click', () => {
    document.querySelector('.container .main_left').classList.remove('active');
    $('#blur').css('display', 'none');
})

// show search
document.querySelector('.searchIcon #show_search').addEventListener('click', (e) => {
    e.target.classList.remove('active');
    document.getElementById('searchInputMb').focus();
    document.querySelector('.container .searchMobile').classList.add('active');
    document.getElementById('hide_search').classList.add('active');
    document.querySelector('.main_right header').classList.add('active');
    $('#blur').css('display', 'block');
    $('#blur').click(function() {
        document.querySelector('.container .searchMobile').classList.remove('active');
        document.getElementById('hide_search').classList.remove('active');
        document.querySelector('.main_right header').classList.remove('active');
        document.getElementById('show_search').classList.add('active');
        $('#blur').css('display', 'none');


    });
})
document.querySelector('#hide_search').addEventListener('click', (e) => {
    e.target.classList.remove('active');
    document.getElementById('show_search').classList.add('active');
    document.querySelector('.main_right header').classList.remove('active');

    document.querySelector('.container .searchMobile').classList.remove('active');
    $('#blur').css('display', 'none');
})