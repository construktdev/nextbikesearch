"""
Allows to search nextbikes by number
"""

import requests


API_URL = (
    "https://maps.nextbike.net/maps/nextbike-live.json"
    "?city=685&domains=dx&list_cities=0&bikes=0"
)


def main():
    """Main method"""

    bike_number = input("Gebe die Nummer ein: ").strip()

    try:
        response = requests.get(API_URL, timeout=10)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"Fehler beim Abrufen der Daten: {e}")
        return

    data = response.json()

    result = find_bike(data, bike_number)

    if result:
        print("\n🚲 Bike gefunden:")
        print(f"Land: {result['country']}")
        print(f"Stadt: {result['city']}")
        print(f"Station: {result['place_name']}")
        print(f"Stationsnummer: {result['place_number']}")
        print(f"Verfügbare Räder: {result['available_bikes']}")
        print(
            f"Koordinaten: {result['coordinates'][0]} "
            f"{result['coordinates'][1]}"
        )
    else:
        print("\n❌ Bike nicht gefunden.")


def find_bike(data, bike_number):
    """Search bike number inside places and return full place info"""

    for country in data.get("countries", []):
        for city in country.get("cities", []):
            for place in city.get("places", []):
                bike_numbers = place.get("bike_numbers", [])

                if bike_number in bike_numbers:
                    return {
                        "country": country.get("country_name"),
                        "city": city.get("name"),
                        "place_name": place.get("name"),
                        "place_number": place.get("number"),
                        "available_bikes": place.get(
                            "bikes_available_to_rent"
                        ),
                        "coordinates": (
                            place.get("lat"),
                            place.get("lng"),
                        ),
                    }

    return None


if __name__ == "__main__":
    main()
