package internal

import (
	"fmt"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"os"
)

func LoadEnv(e *echo.Echo) error {
	env := "local"

	if len(os.Args) > 1 {
		env = os.Args[1]
	} else {
		e.Logger.Info("No environment specified, defaulting to local")
	}

	return godotenv.Load(fmt.Sprint("config/.env.", env))
}
