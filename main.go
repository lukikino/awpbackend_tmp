package main

import (
	"fmt"
	"log"
	"net/http"

	c "awpbackend/controllers"

	"github.com/gernest/utron"
	"google.golang.org/appengine"
)

func main() {

	// Start the MVC App
	app, err := utron.NewMVC()
	if err != nil {
		log.Fatal(err)
	}

	// Register Models
	//app.Model.Register(&models.Todo{})

	// CReate Models tables if they dont exist yet
	//app.Model.AutoMigrateAll()

	// Register Controller
	app.AddController(c.NewLayout)
	app.AddController(c.NewOperations)
	app.AddController(c.NewTransactions)
	app.AddController(c.NewAccounting)
	app.AddController(c.NewReports)
	app.AddController(c.NewSettings)
	app.AddController(c.NewCoreUsers)
	app.AddController(c.NewAgency)
	app.AddController(c.NewMachines)
	app.AddController(c.NewCommon)

	// Start the server
	port := fmt.Sprintf(":%d", app.Config.Port)
	app.Log.Info("staring server on port", port)
	log.Fatal(http.ListenAndServe(port, app))
	appengine.Main()
}
