package web

import search.hotels.Country
import search.hotels.Hotel

class BootStrap {

    def init = { servletContext ->

        10.times {countryIndex ->
            Country country = new Country(name: "Страна ${countryIndex}", capital: "Столица ${countryIndex}")
            10.times {hotelIndex ->
                country.addToHotels(new Hotel(name: "Отель ${hotelIndex}", website: "https://yandex.ru/", rating: 5));
            }
            country.save()
        }

        ArrayList<Hotel> hotels = new HashSet<>(Arrays.asList(
                new Hotel(name: "Abcdfer", website: "https://yandex.ru/", rating: 4, country: new Country(name: 'Румыния', capital: 'Бухарест').save()).save(),
                new Hotel(name: "Abcdferuy", website: "https://yandex.ru/", rating: 1, country: new Country(name: 'Франция', capital: 'Париж').save()).save(),
                new Hotel(name: "Abcdferuypo", website: "https://yandex.ru/", rating: 2, country: new Country(name: 'Швеция', capital: 'Стокгольм').save()).save(),
                new Hotel(name: "Abcdferuypouyt", website: "https://yandex.ru/", rating: 3, country: new Country(name: 'Сербия', capital: 'Белград').save()).save(),
                new Hotel(name: "Abc", website: "", rating: 1, country: new Country(name: 'Россия', capital: 'Москва').save()).save(),
                new Hotel(name: "Abcd", website: "", rating: 2, country: new Country(name: 'Италия', capital: 'Рим').save()).save(),
                new Hotel(name: "Abcdf", website: "https://yandex.ru/", rating: 3, country: new Country(name: 'Испания', capital: 'Мадрид').save()).save(),
                new Hotel(name: "Abcdfe", website: "", rating: 4, country: new Country(name: 'Латвия', capital: 'Рига').save()).save()
        ))

        ArrayList<Country> countries = new HashSet<>(Arrays.asList(
                new Country(name: 'Индия', capital: 'Нью-Дели').save(),
                new Country(name: 'Китай', capital: 'Пекин').save(),
                new Country(name: 'Марокко', capital: 'Рабат').save(),
                new Country(name: 'Танзания', capital: 'Додома').save()
        ))
    }
    def destroy = {
    }
}
