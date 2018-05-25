package controllers

import (
	"net/http"

	"github.com/gernest/utron/controller"
)

//Todo is a controller for Todo list
type Transactions struct {
	controller.BaseController
	Routes []string
}

//Home renders a todo list
func (t *Transactions) Transactions() {
	t.Ctx.Data = map[string]interface{}{
		"title":  "title",
		"header": "My Header",
		"footer": "My Footer",
	}
	t.Ctx.Template = "transactions/transactionsHTML"
	t.HTML(http.StatusOK)
}

//NewTodo returns a new  todo list controller
func NewTransactions() controller.Controller {
	return &Transactions{
		Routes: []string{},
	}
}
