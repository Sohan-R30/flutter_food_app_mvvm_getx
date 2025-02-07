# 🍽️ Recipe Finder App (Flutter + MVVM + GetX)

A **modern Recipe Finder app** built with **Flutter** using **MVVM architecture and GetX** for state management. This app fetches delicious recipes from **TheMealDB API** and provides an interactive and smooth user experience.

---

## 🚀 Features

✅ **Browse Recipes** – View a variety of meals with images and descriptions.  
✅ **Search Recipes** – Find meals by name or ingredients.  
✅ **Filter by Category** – Explore meals based on different categories (e.g., Vegetarian, Seafood).  
✅ **View Recipe Details** – See ingredients, instructions, and preparation steps.  
✅ **Favorites & Shopping List** – Save and manage favorite meals (Coming Soon 🚀).

---

## 🏗️ Architecture: MVVM with GetX

This project follows the **MVVM (Model-View-ViewModel) architecture** with **GetX** for state management, ensuring **clean code, scalability, and maintainability**.

---

## 🏗️ Project Structure
    lib/ 
    ├── models/ - Data models for API response 
    │ └── meal.dart 
    │ 
    ├── controllers/ - Business logic (ViewModel in MVVM) 
    │ └── meal_controller.dart 
    │ 
    ├── views/ - UI components 
    │ ├── home_view.dart 
    │ └── meal_detail_view.dart 
    │ 
    ├── services/ 
    │ └── api_service.dart - API handling 
    │ 
    └── main.dart - App entry point

## 🛠️ Tech Stack
- **Flutter** – UI Framework  
- **Dart** – Programming Language  
- **GetX** – State Management  
- **Dio** – API Client  
- **TheMealDB API** – Recipe Data Source  

---

## 📡 API Usage
This app fetches meal data from **[TheMealDB API](https://www.themealdb.com/api.php)**.  

### 📌 **How to Get API Data?**
1. Go to **[TheMealDB API](https://www.themealdb.com/api.php)**.  
2. Use the **free API** (No key required). Example API URL:  https://www.themealdb.com/api/json/v1/1/search.php?s=chicken

---

## 🎨 Screenshots
Showcase app UI here. Add screenshots of the app’s home screen, search functionality, and details page.

---

## License
This project is MIT Licensed – feel free to use and modify it.


## Contributing
Pull requests are welcome! If you'd like to contribute, please fork the repository and submit a PR.

### Author
##### Md Zahidul Islam Shohan
**mdzahidulislamshohan@gmail.com**
**[LinkedIn](https://www.linkedin.com/in/md-zahidul-islam-shohan/)**
**[Your Portfolio](https://zis-softworks.vercel.app/)**



---

### **How to Use This `README.md` in Your GitHub Repo?**
1. **Replace `"yourusername"`** with your **GitHub username** in the clone URL.  
2. **Add screenshots** once your app UI is ready.  
3. **Update the Author section** with your actual **email, LinkedIn, and portfolio links**.  
4. **Customize as needed** (e.g., add features or changes).  

This `README.md` will make your **GitHub repo look professional** and **impressive to recruiters**! 🚀🔥  

Let me know if you need any modifications. 😊
