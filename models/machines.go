package models

import (
	_ "github.com/go-sql-driver/mysql"
)

type Machine struct {
	ID          int    `db:"id" json:"ID"`
	StoreName   string `db:"store_name" json:"storeName"`
	MachineName string `db:"machine_name" json:"machineName"`
	PCBID       string `db:"pcb_id" json:"pcbID"`
	UserID      int    `db:"user_id" json:"userID"`
	CreatedTime string `db:"created_time" json:"createdTime"`
	UpdateTime  string `db:"update_time" json:"updateTime"`
	Total       int    `db:"total" json:"total"`
}

func GetMachines() ReturnData {
	db := GetConnection()
	mm := []Machine{}
	err := db.Select(&mm, "call sp_getMachines")
	returnData := BoxingToResult(mm, err)
	return returnData
}

func GetMachine(id string) ReturnData {
	db := GetConnection()
	m := Machine{}
	err := db.Get(&m, "call sp_getMachine(?)", id)
	returnData := BoxingToResult(m, err)
	return returnData
}

func EditMachine(id string, data Machine) ReturnData {
	db := GetConnection()
	var count int64 = 0
	res, err := db.Exec("call sp_editMachine(?,?,?)", id, data.StoreName, data.UserID)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}

func DeleteMachine(id string) ReturnData {
	db := GetConnection()
	var count int64 = 0
	res, err := db.Exec("call sp_deleteMachine(?)", id)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}

func AddMachine(data Machine) ReturnData {
	db := GetConnection()
	var count int64 = 0
	res, err := db.Exec("call sp_addMachine(?,?,?)", data.PCBID, data.StoreName, data.UserID)
	if err == nil {
		count, _ = res.RowsAffected()
	}
	returnData := BoxingToResult(count, err)
	return returnData
}
