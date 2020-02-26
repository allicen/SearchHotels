package search.hotels

class Hotel {

    String name
    Integer rating = 1
    String website

    static belongsTo = [country: Country]

    static constraints = {
        name blank: false, maxSize: 255, unique: 'country'
        rating min: 1, max: 5
        website validator: {value, thisObject ->
            if(value != null){
                return value.startsWith('http://') || value.startsWith('https://')
            }else return true
        }, nullable: true
    }
}
