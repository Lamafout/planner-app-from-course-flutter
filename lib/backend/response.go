package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
)

type Response struct {
	Title string  `json:"title"`
	Price float64 `json:"price"`
	Data  string  `json:"data"`
}

func main() {
	http.HandleFunc("/post", func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost {
			http.Error(w, "Invalid request method", http.StatusMethodNotAllowed)
			return
		}

		body, err := io.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "Error reading request body", http.StatusInternalServerError)
			return
		}
		defer r.Body.Close()

		var data Response
		err = json.Unmarshal(body, &data)
		if err != nil {
			http.Error(w, "Error unmarshalling JSON", http.StatusInternalServerError)
			return
		}

		jsonData, err := json.Marshal(data)
		if err != nil {
			http.Error(w, "Error marshalling json", http.StatusInternalServerError)
			return
		}

		fileName := "./transactions.JSON"
		err = os.WriteFile(fileName, jsonData, 0644)
		if err != nil {
			http.Error(w, "Error writing to file", http.StatusInternalServerError)
			return
		}

	})

	fmt.Println("Server starting on port 8080...")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Printf("Failed to start server: %v\n", err)
	}
}
