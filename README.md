#  Pokedex SwiftUI App

A SwiftUI application that showcases a Pokedex, utilizing data fetching from PokeAPI to present detailed information about Pokémon.

## Features

- **SwiftUI Interface:** Clean and straightforward UI design for easy navigation.
- **Data Fetching:** Direct integration with PokeAPI for real-time Pokémon information.

## Screenshots

<img src="listview.png" alt="Main Screen" width="300"/> <img src="detailsview.png" alt="Pokémon Detail" width="300"/>
<br>
*Main app screen showing the list of Pokémon and detail view showing specific information about the selected Pokémon.*

## PokeAPI Integration

The app fetches data in real-time from the following PokeAPI endpoints:

- **List of Pokémon (`pokeapi.co/api/v2/pokemon/?offset=0&limit=493`):** Used to fetch a paginated list of Pokémon. 
> [!NOTE]
> Limited to the first 493. Why 493? Because those are the real ones. Generation IV was the last one I played.
- **Pokémon Details (`pokeapi.co/api/v2/pokemon/{id or name}`):** Retrieves detailed information about a Pokémon, including stats, types, and abilities.

These endpoints are integral to providing the detailed and dynamic Pokémon data showcased in the app.

## How to Use

Clone the repo, open with Xcode, and run on your preferred simulator or device.
