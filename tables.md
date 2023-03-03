### RECIPE TABLE

id String
idUser String
images_recipe String 
videos_recipe  String 
name_recipe string
describe_recipe String
prepare {
    time Int (minutos)
    portion  Int
    ing string 
    word_key  String 
    prepareMode  textLong 
}
nmr_hearts Int
nmr_eyes Int
nmr_saved Int
votes Int 
comments
    {
        idUser String
        ask String
        answer String
    }

createdAt date


### CATEGORIES

id string
name_category string
suggestion
createdAt new Date

### USERS

id String
name String
photo String 
email String 
login String 
password String
engagement {
    nmr_hearts Int
    nmr_eyes Int
    nmr_recipes Int
    nmr_prizes_won
}
createdAt Datetime

### prizes

id string
image String
name String
price Int
available Boolean
createdAt DateTime 

