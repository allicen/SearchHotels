package web.search.hotel

import grails.gorm.transactions.Transactional
import org.springframework.validation.BindingResult
import search.hotels.Country

@Transactional(readOnly = true)
class CountryController {

    static allowedMethods = [save: 'POST', update: 'POST', delete: 'POST', edit: 'GET']

    def index() {
        return [countries: Country.list(params())]
    }

    def params(){
        if(!params.max) params.max = 5
        return params
    }

    def show(Country country){
        def countriesId = Country.findAll().id

        if(country != null && country.id in countriesId) {
            render(view:'show', model:[country: country])
            return 'show'

        }else {
            flash.error = "Страна не найдена"
            render(view:'index', model:[countries: Country.list(params())])
        }
    }

    def create(){
        def country = new Country()
        country.properties = params as BindingResult
        return [country: country]
    }

    def save(){
        def country = new Country(params)
        if(!country.hasErrors() && country.save()) {
            flash.success = "Страна ${country.name} создана успешно!"
            redirect(action:show(country), id: country.id)
        }else {
            render(view:'create', model:[country: country])
        }
    }

    def delete(){
        def country = Country.get(params.id)
        if(country){
            country.delete(flush:true)
            flash.success = "Страна с ID=${params.id} удалена"
        }else {
            flash.error = "Страна с ID=${params.id} не удалена либо была удалена ранее"
        }
        render(view:'index', model:[countries: Country.list(params())])
    }

    def edit(){
        def country = Country.get(params.id)
        render(view:'edition', model:[country: country])
    }

    def update(Country country){
        if(country) {
            country.properties = params as BindingResult
            if(!country.hasErrors() && country.save(flush:true)) {
                flash.success = "Страна с ID=${params.id} обновлена!"
                redirect(action:show(), id:country.id)
            }
            else {
                render(view:'edition', model:[country:country])
            }
        }
        else {
            flash.error = "Не найдена страна с ID=${params.id}"
            redirect(action:edit(), id:params.id)
        }
    }
}
