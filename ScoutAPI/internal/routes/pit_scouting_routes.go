package routes

import (
	"github.com/labstack/echo/v4"
	"go.mongodb.org/mongo-driver/mongo"
)

func SetupPitScoutingRoutes(e echo.Echo, db mongo.Client) {
	e.POST("/pit", func(c echo.Context) error {
		return nil
	})
}
