from api.serializers import RecipesSerializer


data = {"ingredients": [{"id": 1, "amount": 1}],
        "tags": [1, 2],
        "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAgMAAABieywaAAAACVBMVEUAAAD///9fX1/S0ecCAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAACklEQVQImWNoAAAAggCByxOyYQAAAABJRU5ErkJggg==",
        "name": "string",
        "text": "string",
        "cooking_time": 1
        }

ser = RecipesSerializer(data=data)

if not ser.is_valid():
    print(ser.errors)
print(ser)
print(ser.validated_data)
print(ser.data)


print(ser.save())
