const url = document.location.pathname.split(/[/?&=]/);
const category = url[1];
const page = url[2];

function requiredMarkForForm() { // Обязательные поля формы
    let form = document.querySelectorAll(".dialog label input[type=text]");

    form.forEach(function (element) {
        let getMarkForElement = element.previousElementSibling.querySelector("span");
        if(element.hasAttribute("required") && element.getAttribute("required") === "required"){
            getMarkForElement.classList.add("show");
        }else {
            getMarkForElement.classList.add("hide");
        }
    });
}

function getHotelRating(){ // Рейтинг отелей
    let ratingArea = document.querySelectorAll(".rating-area label");
    let ratingValue = document.getElementById("rating");

    if(ratingValue.value > 0){
        document.getElementById("star-"+ratingValue.value).checked = true;
    }

    [].forEach.call(ratingArea,function(element){
        element.addEventListener('click', function (event) {
            ratingValue.value = element.dataset.val;
        })
    });
}

function mobileTitle(){ // Удаление заголовка компании на маленьких экранах
    const elemClasses = document.querySelector('.logo span').classList;
    if(window.innerWidth < 800){
        elemClasses.add('hide');
    }else {
        elemClasses.remove('hide');
    }
}

function topMenuColor() { // Подсветка меню в зависимости от страницы
    let tabs = document.querySelectorAll('.container .main header .items a');
    for(let elem = 0; elem < tabs.length; elem++){
        let attr = tabs[elem].getAttribute('href').replace(/[/]/g, '');

        if(attr === category){
            tabs[elem].classList.add('top-menu-active');
        }else {
            tabs[elem].classList.remove('top-menu-active');
        }
    }
}

if(category === 'hotel' && (page === 'index' || page === 'save' || page === 'update')){ // Вывод рейтинга отелей на страницах редактирования
    getHotelRating();
}

window.addEventListener('resize',function(){ // Действия при изменении ширины окна
    mobileTitle();
});

mobileTitle();
requiredMarkForForm();
topMenuColor();
