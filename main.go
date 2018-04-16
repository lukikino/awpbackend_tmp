package main

import (
	"fmt"
	"log"
	"net/http"

	c "./controllers"
	"./models"
	"github.com/gernest/utron"
)

func main() {

	// Start the MVC App
	app, err := utron.NewMVC()
	if err != nil {
		log.Fatal(err)
	}

	// Register Models
	app.Model.Register(&models.Todo{})

	// CReate Models tables if they dont exist yet
	app.Model.AutoMigrateAll()

	// Register Controller
	app.AddController(c.NewTodo)
	app.AddController(c.NewOperations)
	app.AddController(c.NewTransactions)
	app.AddController(c.NewAccounting)
	app.AddController(c.NewReports)
	app.AddController(c.NewSettings)
	app.AddController(c.NewUsers)
	app.AddController(c.NewMachines)

	// Start the server
	port := fmt.Sprintf(":%d", app.Config.Port)
	app.Log.Info("staring server on port", port)
	log.Fatal(http.ListenAndServe(port, app))
}
