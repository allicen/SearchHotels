package web.search.hotel
import grails.gorm.transactions.Transactional
import search.hotels.Country
import search.hotels.Hotel

@Transactional(readOnly = true)
class SearchController {

    def index() { }

    def results(){
        def query = request.getParameter('query')
        def countryId = request.getParameterValues('countryId') as List<Long>

        if(query.length() == 0){
            flash.message = "Введен пустой поисковый запрос"
            render(view: 'index')
        }else if(countryId == null){
            flash.message = "Не выбрана страна для поиска"
            render(view: 'index')
        }else {
            def hotels = Hotel.findAllByCountryInListAndNameIlike(Country.findAllByIdInList(countryId) as List, '%'+query+'%', [sort: ['rating': 'desc', 'name': 'asc']])
            return [hotels: hotels, query: query]
        }
    }
}
