package controllers

import (
	"net/http"

	m "../models"
	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Agency struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Agency) GetUsers() {
	t.RenderJSON(m.GetUsers(true), http.StatusOK)
}

//Home renders a todo list
func (t *Agency) AddUser() {
	data := m.User{}
	req := t.Ctx.Request()
	req.ParseForm()
	if err := decoder.Decode(&data, req.PostForm); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.AddUser(data, true), http.StatusOK)
	}
}

//Home renders a todo list
func (t *Agency) EditPassword() {
	data := m.Machine{}
	req := t.Ctx.Request()
	pwd := ""
	req.ParseForm()
	if err := decoder.Decode(&data, req.PostForm); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.ChangeUserPassword(t.Ctx.Params["id"], pwd), http.StatusOK)
	}
}

//NewTodo returns a new  todo list controller
func NewAgency() controller.Controller {
	return &Agency{
		Routes: []string{
			"get;/api/agency;GetUsers",
			"post;/api/agency/add;AddUser",
			"post;/api/agency/password/{id};EditPassword",
		},
	}
}
