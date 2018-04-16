package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

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
func (t *Machines) List() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "machines/listHTML"
	t.HTML(http.StatusOK)
}

//NewTodo returns a new  todo list controller
func NewMachines() controller.Controller {
	return &Machines{
		Routes: []string{
			"get;/machines/list;List",
			"get;/machines/transfer;Transfer",
		},
	}
}
