import requests

# Define your ESI base URL
esi_base_url = "https://esi.evetech.net/latest"

# Function to get a character name from a character ID
def get_character_name(character_id):
    character_name = None

    # Make a GET request to the ESI API to retrieve character information
    character_url = f"{esi_base_url}/characters/{character_id}/"
    response = requests.get(character_url)

    if response.status_code == 200:
        character_info = response.json()
        character_name = character_info.get("name")

    return character_name

if __name__ == "__main__":
    # Provide the character ID for which you want to get the name
    character_id = 91409452
    # Replace with your character ID

    # Get the character name
    character_name = get_character_name(character_id)

    if character_name:
        print(f"Character ID: {character_id}, Character Name: {character_name}")
    else:
        print(f"Character ID: {character_id} not found or an error occurred.")