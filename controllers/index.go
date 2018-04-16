package controllers

import (
	"net/http"
	"strconv"

	"../models"

	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Todo struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Todo) Home() {
	todos := []*models.Todo{}
	t.Ctx.DB.Order("created_at desc").Find(&todos)
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "indexHTML"
	t.HTML(http.StatusOK)
}

//Create creates a todo  item
func (t *Todo) Create() {
	todo := &models.Todo{}
	req := t.Ctx.Request()
	_ = req.ParseForm()

	t.Ctx.DB.Create(todo)
	t.Ctx.Redirect("/", http.StatusFound)
}

//Delete deletes a todo item
func (t *Todo) Delete() {
	todoID := t.Ctx.Params["id"]
	ID, err := strconv.Atoi(todoID)
	if err != nil {
		t.Ctx.Data["Message"] = err.Error()
		t.Ctx.Template = "error"
		t.HTML(http.StatusInternalServerError)
		return
	}
	t.Ctx.DB.Delete(&models.Todo{ID: ID})
	t.Ctx.Redirect("/", http.StatusFound)
}

//NewTodo returns a new  todo list controller
func NewTodo() controller.Controller {
	return &Todo{
		Routes: []string{
			"get;/;Home",
			"post;/create;Create",
			"get;/delete/{id};Delete",
		},
	}
}
