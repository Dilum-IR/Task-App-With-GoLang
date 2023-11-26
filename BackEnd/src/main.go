package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID          string `json:"id"`
	TaskName    string `json:"task_name"`
	TaskDetails string `json:"task_details"`
	Date        string `json:"date"`
}

var tasks []Tasks

func allTasks() {

	task := Tasks{
		ID:          "1",
		TaskName:    "New project",
		TaskDetails: "you must",
		Date:        "2023-11-25",
	}

	tasks = append(tasks, task)
	task1 := Tasks{
		ID:          "1235",
		TaskName:    "New project",
		TaskDetails: "you must",
		Date:        "2023-11-25",
	}

	tasks = append(tasks, task1)
	fmt.Println("your tasks are", tasks)

}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am home page")
}

// find all tasks
func getTasks(w http.ResponseWriter, r *http.Request) {
	
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
	
}

// find the specific task
func getTask(w http.ResponseWriter, r *http.Request) {

	// get the task id using router path `id`
	taskId := mux.Vars(r)
	flag := false

	for i := 0; i < len(tasks); i++ {
		if taskId["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}

		if flag == false {
			json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
		}
	}
}

func create(w http.ResponseWriter, r *http.Request) {

}
func delete(w http.ResponseWriter, r *http.Request) {

}
func update(w http.ResponseWriter, r *http.Request) {

}

// all routers
func handleRoute() {

	router := mux.NewRouter()

	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/get_tasks", getTasks).Methods("GET")
	router.HandleFunc("/get_task/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", create).Methods("POST")
	router.HandleFunc("/delete/{id}", delete).Methods("DELETE")
	router.HandleFunc("/update/{id}", update).Methods("PUT")

	log.Fatal(http.ListenAndServe(":8080", router))

}

func main() {

	allTasks()
	handleRoute()

}
