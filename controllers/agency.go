package controllers

import (
	"encoding/json"
	"net/http"

	m "github.com/awpbackend/models"

	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Agency struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Agency) GetUsers() {
	t.RenderJSON(m.GetUsers(false), http.StatusOK)
}

//Home renders a todo list
func (t *Agency) GetUserPermissions() {
	t.RenderJSON(m.GetUserPermissions(t.Ctx.Params["id"], false), http.StatusOK)
}

//Home renders a todo list
func (t *Agency) EditUserPermissions() {
	req := t.Ctx.Request()
	decoder := json.NewDecoder(req.Body)
	var data m.User
	err := decoder.Decode(&data)
	if err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.EditUserPermissions(data), http.StatusOK)
	}
	defer req.Body.Close()
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
		t.RenderJSON(m.AddUser(data, false), http.StatusOK)
	}
}

func (t *Agency) ToggleActive() {
	t.RenderJSON(m.ToggleUserActive(t.Ctx.Params["id"]), http.StatusOK)
}

//Home renders a todo list
func (t *Agency) EditPassword() {
	data := m.User{}
	req := t.Ctx.Request()
	req.ParseForm()
	if err := decoder.Decode(&data, req.PostForm); err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.RenderJSON(m.ErrorResult(err.Error(), "400"), http.StatusBadRequest)
		return
	} else {
		t.RenderJSON(m.ChangeUserPassword(t.Ctx.Params["id"], data.Password), http.StatusOK)
	}
}

//NewTodo returns a new  todo list controller
func NewAgency() controller.Controller {
	return &Agency{
		Routes: []string{
			"get;/api/agency;GetUsers",
			"post;/api/agency;AddUser",
			"get;/api/agency/permissions/{id};GetUserPermissions",
			"post;/api/agency/permissions;EditUserPermissions",
			"post;/api/agency/active/{id};ToggleActive",
			"post;/api/agency/password/{id};EditPassword",
		},
	}
}
