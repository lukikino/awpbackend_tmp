package models

import (
	"crypto/sha512"
	"fmt"
	"strconv"
	"strings"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

type User struct {
	ID          int          `db:"id" json:"ID"`
	Account     string       `db:"account" json:"account"`
	Password    string       `json:"password"`
	State       int          `db:"state" json:"state"`
	Permissions []Permission `json:"permissions"`
	CreatedTime string       `db:"created_time" json:"createdTime"`
	UpdateTime  string       `db:"update_time" json:"updateTime"`
	Total       int          `db:"total" json:"total"`
}

type Permission struct {
	ID          int    `db:"id" json:"ID"`
	Active      bool   `db:"active" json:"active"`
	Name        string `db:"name" json:"name"`
	Description string `db:"description" json:"description"`
	CreatedTime string `db:"created_time" json:"createdTime"`
	UpdateTime  string `db:"update_time" json:"updateTime"`
	Total       int    `db:"total" json:"total"`
}

type usersTree struct {
	UserID   int    `db:"user_id" json:"userID"`
	Account  string `db:"account" json:"account"`
	ParentID int    `db:"parent_id" json:"parentID"`
}

//common use
func encryptedPassword(pwd, pwdMask string) string {
	maskedPwd := make([]byte, 128)
	//use id to genrator mask
	maskSha512 := sha512.New()
	maskSha512.Write([]byte(pwdMask))
	mask := []byte(fmt.Sprintf("%x", maskSha512.Sum(nil)))
	pwdb := []byte(pwd)
	//use mask and pwd do bitwise cal
	for i, el := range pwdb {
		maskedPwd[i] = el & mask[i]
	}

	//sha result string
	sha_512 := sha512.New()
	sha_512.Write(maskedPwd)
	return fmt.Sprintf("%x", sha_512.Sum(nil))
}

func GetUsers(admin bool) ReturnData {
	db := GetConnection()
	mm := []User{}
	err := db.Select(&mm, "call sp_getUsers(?)", admin)
	returnData := BoxingToResult(mm, err)
	return returnData
}

func GetUsersTree() ReturnData {
	db := GetConnection()
	at := []usersTree{}
	err := db.Select(&at, "call sp_getUsersTree(?)", 2)
	returnData := BoxingToResult(at, err)
	return returnData
}

func GetUserPermissions(id string, admin bool) ReturnData {
	db := GetConnection()
	m := []Permission{}
	err := db.Select(&m, "call sp_getUserPermissions(?,?,?)", 2, id, admin)
	returnData := BoxingToResult(m, err)
	return returnData
}

func EditUserPermissions(data User) ReturnData {
	db := GetConnection()
	var count int64
	var parr []string
	var pstr string
	if len(data.Permissions) > 0 {
		for _, el := range data.Permissions {
			if el.Active {
				parr = append(parr, fmt.Sprintf("%v", el.Name))
			}
		}
		pstr = strings.Join(parr, ",")
	}
	err := db.Get(&count, "call sp_editUserPermissions(?,?,?)", 2, data.ID, pstr)
	returnData := BoxingToResult(count, err)
	return returnData
}

func ChangeUserPassword(id, pw string) ReturnData {
	db := GetConnection()
	var count int64
	var err error
	u := User{}
	db.Get(&u, "call sp_getUser(?)", id)
	if u.ID != 0 {
		t, _ := time.Parse(DatetimeFormat, u.CreatedTime)
		pwd := encryptedPassword(pw, strconv.FormatInt(t.UnixNano(), 10))
		res, err := db.Exec("call sp_editUserPassword(?,?,?)", 1, id, pwd)
		if err == nil {
			count, _ = res.RowsAffected()
		}
	}
	returnData := BoxingToResult(count, err)
	return returnData
}

func ToggleUserActive(id string) ReturnData {
	db := GetConnection()
	u := User{}
	err := db.Get(&u, "call sp_editUserActive(?,?)", 1, id)
	returnData := BoxingToResult(u, err)
	return returnData
}

func AddUser(data User, admin bool) ReturnData {
	db := GetConnection()
	var count int64
	now := time.Now().UTC().Add(time.Hour * time.Duration(TimeZone))
	pwd := encryptedPassword(data.Password, strconv.FormatInt(now.UnixNano(), 10))
	err := db.Get(&count, "call sp_addUser(?,?,?,?,?)", 2, data.Account, pwd, admin, now.UTC().Format(DatetimeFormat))
	returnData := BoxingToResult(count, err)
	return returnData
}