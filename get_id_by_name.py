import requests

# Define your ESI base URL
esi_base_url = "https://esi.evetech.net/latest"

# Function to get character IDs from character names using /universe/ids/ endpoint

cname = [ "CCP Zoetrope" ]
character_list = [ "CCP Zoetrope", "Chaunnay Solette" ]
def get_character_ids(cname):
    character_ids = {}
    ids_url = f"{esi_base_url}/universe/ids/"

    # Make a POST request to the ESI API to resolve character names to IDs
   #data = {"names": character_names}
    #data =  [ "CCP Zoetrope" ] #works
    data = character_list
    response = requests.post(ids_url, json=data)
    print(response)
    if response.status_code == 200:
        results = response.json()
        if 'characters' in results:
            for result in results['characters']:
                character_name = result['name']
                character_id = result['id']
                character_ids[character_name] = character_id

    return character_ids

if __name__ == "__main__":
    # Provide a list of character names for which you want to get the IDs
    character_names =   ["CCP Zoetrope"]

    # Get character IDs for the provided character names
    character_ids = get_character_ids(character_names)

    for name, char_id in character_ids.items():
        print(f"Character Name: {name}, Character ID: {char_id}")