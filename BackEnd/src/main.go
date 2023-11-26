package main

import (
	"fmt"
)


type Tasks struct{
	ID string `json:"id"`
	TaskName string `json:"task_name"`
	TaskDetails string `json:"task_details"`
	Date string `json:"date"`
}

var tasks []Tasks


func allTasks(){
	task :=Tasks{
		ID: "1235",
		TaskName: "New project",
		TaskDetails: "you must",
		Date: "2023-11-25",
	}

	tasks = append(tasks, task)
	task1 :=Tasks{
		ID: "1235",
		TaskName: "New project",
		TaskDetails: "you must",
		Date: "2023-11-25",
	}

	tasks = append(tasks, task1)
	fmt.Println("your tasks are",tasks)

}


func main() {

	allTasks()
	fmt.Println("hello hi")


}
