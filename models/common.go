package models

import (
	"reflect"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

const TimeZone = 8

// const DatetimeFormat = "2006/01/02 15:04:05"
const DatetimeFormat = "2006-01-02 15:04:05"

func GetConnection() *sqlx.DB {
	db, _ := sqlx.Open("mysql", "root:0956787248@/pcb")
	return db
}

func BoxingToResult(data interface{}, err error) ReturnData {
	returnData := ReturnData{}
	returnData.Data = data
	if err != nil {
		returnData.Message = err.Error()
		returnData.Code = "500"
	} else {
		returnData.Code = "200"
		if reflect.TypeOf(data).Kind() == reflect.Array || reflect.TypeOf(data).Kind() == reflect.Slice {
			vacct := reflect.ValueOf(data)
			if vacct.Len() > 0 {
				st := vacct.Slice(0, 1).Index(0).Type()
				_, totalExist := st.FieldByName("Total")
				if totalExist {
					// fmt.Println(vacct.Slice(0, 1))
					// fmt.Println(vacct.Slice(0, 1).Index(0).FieldByName("Total"))
					returnData.Total = (int)(vacct.Slice(0, 1).Index(0).FieldByName("Total").Int())
				}
			}
		} else if reflect.TypeOf(data).Kind() == reflect.Int64 {
			vacct := reflect.ValueOf(data)
			if vacct.Int() > 0 {
				returnData.Code = "200"
				returnData.Message = "Success"
			} else {
				returnData.Code = "500"
				returnData.Message = "No Affected Rows"
			}
		}
	}
	return returnData
}

func ErrorResult(message, code string) ReturnData {
	returnData := ReturnData{}
	returnData.Message = message
	returnData.Code = code
	return returnData
}

func FakeDataGenrator(dest interface{}, number int) {

}

type ReturnData struct {
	Code    string      `json:"code"`
	Message string      `json:"message"`
	Data    interface{} `json:"data"`
	Total   int         `json:"total"`
}
