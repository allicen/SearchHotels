package web.search.hotel

import grails.gorm.transactions.Transactional
import org.springframework.validation.BindingResult
import search.hotels.Hotel

@Transactional(readOnly = true)
class HotelController {

    static allowedMethods = [save: 'POST', update: 'POST', delete: 'POST', edit: 'GET']

    def index() {
        return [hotels: Hotel.list(params())]
    }

    def params(){
        if(!params.max) params.max = 5
        return params
    }

    def show(Hotel hotel){
        def hotelsId = Hotel.findAll().id

        if(hotel != null && hotel.id in hotelsId) {
            render(view:'show', model:[hotel: hotel])
            return 'show'

        }else {
            flash.error = "Отель не найден"
            render(view:'index', model:[hotels: Hotel.list(params())])
        }
    }

    def create(){
        def hotel = new Hotel()
        hotel.properties = params as BindingResult
        return [hotel: hotel]
    }

    def save(Hotel hotel){
        def hotelSave = new Hotel(params)
        hotelSave.country = hotel.country;
        if(!hotelSave.hasErrors() && hotelSave.save()) {
            flash.success = "Отель «${hotelSave.name}» создан успешно!"
            redirect(action:show(hotelSave), id: hotelSave.id)
        }else {
            render(view:'create', model:[hotel: hotelSave])
        }
    }

    def delete(){
        def hotel = Hotel.get(params.id)
        if(hotel){
            hotel.delete(flush:true)
            flash.success = "Отель с ID=${params.id} удален"
        }else {
            flash.error = "Отель с ID=${params.id} не удален либо был удален ранее"
        }
        render(view:'index', model:[hotels: Hotel.list(params())])
    }

    def edit(){
        def hotel = Hotel.get(params.id)
        render(view:'edition', model:[hotel: hotel])
    }

    def update(Hotel hotel){
        if(hotel) {
            hotel.properties = params as BindingResult
            if(!hotel.hasErrors() && hotel.save(flush:true)) {
                flash.success = "Отель с ID=${params.id} обновлен!"
                redirect(action:show(hotel), id:hotel.id)
            }else {
                render(view:'edition', model:[hotel:hotel])
            }
        }
        else {
            flash.error = "Не найден отель с ID=${params.id}"
            redirect(action:edit(), id:params.id)
        }
    }
}