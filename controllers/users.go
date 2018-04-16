package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Users struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Users) Core() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "users/coreHTML"
	t.HTML(http.StatusOK)
}

func (t *Users) Agency() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "users/agencyHTML"
	t.HTML(http.StatusOK)
}

//NewTodo returns a new  todo list controller
func NewUsers() controller.Controller {
	return &Users{
		Routes: []string{
			"get;/users/core;Core",
			"get;/users/agency;Agency",
		},
	}
}
