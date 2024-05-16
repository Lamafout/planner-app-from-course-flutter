package main

import (
	"encoding/json"
	"net/http"
	"os"

	"github.com/rs/cors"
)

type Data struct {
	Id    string `json:"id"`
	Title string `json:"title"`
	Price string `json:"price"`
	Date  string `json:"date"`
}

func main() {
	http.HandleFunc("/", addObjectHandler)
	handler := cors.Default().Handler(http.HandlerFunc(addObjectHandler))
	http.ListenAndServe(":8080", handler)
}

func addObjectHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
		return
	}

	var obj Data
	err := json.NewDecoder(r.Body).Decode(&obj)
	if err != nil {
		http.Error(w, "Failed to decode JSON object", http.StatusBadRequest)
		return
	}

	err = saveObjectToFile(obj)
	if err != nil {
		http.Error(w, "Failed to save object to file", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Object saved successfully"))
}

func saveObjectToFile(obj Data) error {
	// запишем данные из файла в переменную
	file, err := os.ReadFile("transactions.json")
	if err != nil {
		return err
	}
	fileModed := file[1 : len(file)-1]

	// сделаем введённые пользователем данные json-ом
	data, err := json.Marshal(obj)
	if err != nil {
		return err
	}
	dataModed := append([]byte{','}, data...)

	// создаем новый срез, объединяя все части в правильном порядке
	newFile := append(append(append([]byte{'['}, fileModed...), dataModed...), []byte{']'}...)

	return os.WriteFile("transactions.json", newFile, 0644)
}
