package controllers

import (
	"encoding/json"
	"net/http"

	m "models"
	"github.com/gernest/utron/controller"
	"github.com/gorilla/schema"
)

var decoder = schema.NewDecoder()

//Todo is a controller for Todo list
type Machines struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Machines) Transfer() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "machines/transferHTML"
	t.HTML(http.StatusOK)
}

//Home renders a todo list
func (t *Machines) GetMachines() {
	t.RenderJSON(m.GetMachines(), http.StatusOK)
}

//Home renders a todo list
func (t *Machines) GetMachine() {
	// req := t.Ctx.Request()
	t.RenderJSON(m.GetMachine(t.Ctx.Params["id"]), http.StatusOK)
}

//Home renders a todo list
func (t *Machines) GetMachinesWithUsers() {
	// req := t.Ctx.Request()
	t.RenderJSON(m.GetMachinesWithUsers(), http.StatusOK)
}

//Home renders a todo list
func (t *Machines) TransferMachines() {
	// req := t.Ctx.Request()
	req := t.Ctx.Request()
	decoder := json.NewDecoder(req.Body)
	var data m.MachineTransfer
	if err := decoder.Decode(&data); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.TransferMachines(data), http.StatusOK)
	}
}

//Home renders a todo list
func (t *Machines) AddMachine() {
	data := m.Machine{}
	req := t.Ctx.Request()
	req.ParseForm()
	if err := decoder.Decode(&data, req.PostForm); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.AddMachine(data), http.StatusOK)
	}
}

//Home renders a todo list
func (t *Machines) EditMachine() {
	data := m.Machine{}
	req := t.Ctx.Request()
	req.ParseForm()
	if err := decoder.Decode(&data, req.PostForm); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.EditMachine(t.Ctx.Params["id"], data), http.StatusOK)
	}
}

//Home renders a todo list
func (t *Machines) DeleteMachine() {
	// req := t.Ctx.Request()
	t.RenderJSON(m.DeleteMachine(t.Ctx.Params["id"]), http.StatusOK)
}

//NewTodo returns a new  todo list controller
func NewMachines() controller.Controller {
	return &Machines{
		Routes: []string{
			"get;/api/machinetransfer;GetMachinesWithUsers",
			"post;/api/machinetransfer;TransferMachines",

			"get;/api/machines;GetMachines",
			"post;/api/machines;AddMachine",
			"get;/api/machines/{id};GetMachine",
			"post;/api/machines/{id};EditMachine",
			"delete;/api/machines/{id};DeleteMachine",
		},
	}
}
